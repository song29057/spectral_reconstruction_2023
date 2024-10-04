import numpy as np
import torch
import torch.nn as nn
import torch.optim
from torch.nn import functional
import os
os.environ['KMP_DUPLICATE_LIB_OK']='TRUE'

class TSR_Dataset(torch.utils.data.Dataset):
    def __init__(self, x_low1, x_low2, x_high1, x_high2, y_train1, y_train2, y_label):
        self.x_low1 = x_low1.astype(np.float32)
        self.x_low2 = x_low2.astype(np.float32)
        self.x_high1 = x_high1.astype(np.float32)
        self.x_high2 = x_high2.astype(np.float32)
        self.y_train1 = y_train1.astype(np.float32)
        self.y_train2 = y_train2.astype(np.float32)
        self.y_label = y_label.astype(np.float32)

    def __getitem__(self, idx):
        if torch.is_tensor(idx):
            idx = idx.tolist()
        x_low1 = self.x_low1[idx]
        x_low2 = self.x_low2[idx]
        x_high1 = self.x_high1[idx]
        x_high2 = self.x_high2[idx]
        y_train1 = self.y_train1[idx]
        y_train2 = self.y_train2[idx]
        y_label = self.y_label[idx]
        return np.array(x_low1), np.array(x_low2), np.array(x_high1), np.array(x_high2), np.array(y_train1), np.array(y_train2), np.array(y_label)

    def __len__(self):
        return len(self.x_low1)

XTrain_l1 = np.loadtxt('D:\Postdoc\Paper 8\FRC_data\Twin data\XTrain-l1.csv', delimiter=',')
XTrain_l2 = np.loadtxt('D:\Postdoc\Paper 8\FRC_data\Twin data\XTrain-l2.csv', delimiter=',')
XTrain_h1 = np.loadtxt('D:\Postdoc\Paper 8\FRC_data\Twin data\XTrain-h1.csv', delimiter=',')
XTrain_h2 = np.loadtxt('D:\Postdoc\Paper 8\FRC_data\Twin data\XTrain-h2.csv', delimiter=',')
YTrain_label = np.loadtxt('D:\Postdoc\Paper 8\FRC_data\Twin data\label.csv', delimiter=',')
XTest_l = np.loadtxt('D:\Postdoc\Paper 8\FRC_data\Twin data\XTest-l.csv', delimiter=',')
XTest_h = np.loadtxt('D:\Postdoc\Paper 8\FRC_data\Twin data\XTest-h.csv', delimiter=',')
YTrain = np.loadtxt('D:\Postdoc\Paper 8\FRC_data\Twin data\YTrain.csv', delimiter=',')
YTest = np.loadtxt('D:\Postdoc\Paper 8\FRC_data\Twin data\YTest.csv', delimiter=',')
XTrain_l = np.loadtxt('D:\Postdoc\Paper 8\FRC_data\Twin data\XTrain-l.csv', delimiter=',')
XTrain_h = np.loadtxt('D:\Postdoc\Paper 8\FRC_data\Twin data\XTrain-h.csv', delimiter=',')
YTrain1 = np.loadtxt('D:\Postdoc\Paper 8\FRC_data\Twin data\YTrain1.csv', delimiter=',')
YTrain2 = np.loadtxt('D:\Postdoc\Paper 8\FRC_data\Twin data\YTrain2.csv', delimiter=',')

class TSR_Net(nn.Module):
    def __init__(self):
        super(TSR_Net, self).__init__()
        self.model1 = nn.Sequential(
            nn.Linear(in_features=260, out_features=96, bias=True),
            nn.Tanh(),
            nn.Dropout(p=0.2),

            nn.Linear(in_features=96, out_features=32, bias=True),
        )

        self.model2 = nn.Sequential(
            nn.Linear(in_features=32, out_features=64, bias=True),
            nn.Tanh(),
            nn.Dropout(p=0.2),

            nn.Linear(in_features=64, out_features=128, bias=True),
            nn.Tanh(),
            nn.Dropout(p=0.2),

            nn.Linear(in_features=128, out_features=423, bias=True),
        )

        self.model3 = nn.Sequential(
            nn.LayerNorm(32),
            nn.Linear(in_features=32, out_features=7, bias=True),
        )

    def forward(self, x1, x2):
        proj1, recon1 = self.forward_once(x1)
        proj2, recon2 = self.forward_once(x2)
        y = self.model3(proj2)
        return proj1, recon1, proj2, recon2, y

    def forward_once(self, x):
        proj = self.model1(x)
        recon = self.model2(proj)
        return proj, recon

train_set = TSR_Dataset(XTrain_l1, XTrain_l2, XTrain_h1, XTrain_h2, YTrain1, YTrain2, YTrain_label)
num_epochs = 30
batch_size = 16
learning_rate1 = 0.001
learning_rate2 = 0.001
learning_rate3 = 0.001

train_loader = torch.utils.data.DataLoader(train_set, batch_size=batch_size, shuffle=True)
device = torch.device('cuda') if torch.cuda.is_available() else torch.device('cpu')
model = TSR_Net().to(device)

class ContrastiveLoss(torch.nn.Module):
    def __init__(self, margin=2.0):
        super(ContrastiveLoss, self).__init__()
        self.margin = margin

    def forward(self, x1, x2, y):
        dist = functional.pairwise_distance(x1, x2)
        total_loss = (1 - y) * torch.pow(dist, 2) + y * torch.pow(torch.clamp_min_(self.margin - dist, 0), 2)
        loss = torch.mean(total_loss)
        return loss

loss_function1 = ContrastiveLoss()
loss_function2 = nn.L1Loss()
loss_function3 = nn.CrossEntropyLoss()

optimizer1 = torch.optim.Adam(model.parameters(), lr=learning_rate1)
optimizer2 = torch.optim.Adam(model.parameters(), lr=learning_rate2)
optimizer3 = torch.optim.Adam(model.parameters(), lr=learning_rate3)

scheduler1 = torch.optim.lr_scheduler.MultiStepLR(optimizer1, milestones=[5, 10, 15, 20, 25, 30, 35, 40, 45], gamma=0.5)
scheduler2 = torch.optim.lr_scheduler.MultiStepLR(optimizer2, milestones=[5, 10, 15, 20, 25, 30, 35, 40, 45], gamma=0.5)
scheduler3 = torch.optim.lr_scheduler.MultiStepLR(optimizer3, milestones=[5, 10, 15, 20, 25, 30, 35, 40, 45], gamma=0.5)

PATH = 'D:\Postdoc\Paper 8\Model\model-TSR.pth'
state = torch.load(PATH)
model.load_state_dict(state['model_state'])
optimizer1.load_state_dict(state['optimizer1'])
optimizer2.load_state_dict(state['optimizer2'])
optimizer3.load_state_dict(state['optimizer3'])

[m2, n2] = XTest_l.shape
Xa = torch.from_numpy(XTest_l.astype(np.float32))
Xb = torch.from_numpy(XTest_l.astype(np.float32))
Xc = torch.from_numpy(XTrain_l.astype(np.float32))
Xd = torch.from_numpy(XTrain_l.astype(np.float32))

model.eval()
with torch.no_grad():
    p1, cons1, p2, cons2, cls1 = model(Xa, Xb)
    Pred_test = cons1.squeeze().cpu().detach().numpy()
    p3, cons3, p4, cons4, cls3 = model(Xc, Xd)
    Pred_train = cons3.squeeze().cpu().detach().numpy()

m1, n1 = YTest.shape
cls1 = torch.max(cls1, 1)[1].data.numpy()

YTest = torch.from_numpy(YTest)
YTest = torch.max(YTest, 1)[1].data.numpy()
acc = sum(YTest==cls1)/m1
print(acc)
