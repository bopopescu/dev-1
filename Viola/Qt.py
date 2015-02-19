__author__ = 'ssven'

import sys
from PyQt4 import QtGui, QtCore


class Example(QtGui.QWidget):

    def __init__(self):
        super(Example, self).__init__()

        self.initUI()


    def initUI(self):

        # lbl1 = QtGui.QLabel('ZetCode', self)
        # lbl1.move(15,10)
        #
        # lbl2 = QtGui.QLabel('tutorials', self)
        # lbl2.move(35,40)
        #
        # lbl3 = QtGui.QLabel('for programmers', self)
        # lbl3.move(55,70)
        #
        # textEdit = QtGui.QTextEdit()
        # self.setCentralWidget(textEdit)
        #
        #
        # exitAction = QtGui.QAction(QtGui.QIcon('exit24.png'), 'Exit', self)
        # exitAction.setShortcut('Ctrl+Q')
        # exitAction.setStatusTip('Exit Application')
        # exitAction.triggered.connect(QtGui.qApp.quit)
        #
        # self.statusBar()
        #
        # self.toolbar = self.addToolBar('Exit')
        # self.toolbar.addAction(exitAction)
        #
        # menubar= self.menuBar()
        # fileMenu = menubar.addMenu('&File')
        # fileMenu.addAction(exitAction)

        # btn = QtGui.QPushButton('Quit', self)
        # btn.clicked.connect(QtCore.QCoreApplication.instance().quit)
        # btn.resize(btn.sizeHint())
        # btn.move(50,50)
        #
        # okButton = QtGui.QPushButton("OK")
        # cancelButton = QtGui.QPushButton("Cancel")
        #
        # hbox = QtGui.QHBoxLayout()
        # hbox.addStretch(1)
        # hbox.addWidget(okButton)
        # hbox.addWidget(cancelButton)
        #
        #
        # vbox = QtGui.QVBoxLayout()
        # vbox.addStretch(1)
        # vbox.addLayout(hbox)
        #
        # self.setLayout(vbox)

        # #grid layouts
        # grid = QtGui.QGridLayout()
        # self.setLayout(grid)
        #
        # names = ['Cls', 'Bck', '', 'Close',
        #          '7', '8', '9', '/',
        #         '4', '5', '6', '*',
        #          '1', '2', '3', '-',
        #         '0', '.', '=', '+']
        #
        # positions = [(i,j) for i in range(5) for j in range(4)]
        #
        # for position, name in zip(positions, names):
        #
        #     if name == '':
        #         continue
        #     button = QtGui.QPushButton(name)
        #     grid.addWidget(button, *position)
        #

        # #basic text enrtry
        # title = QtGui.QLabel('Title')
        # author = QtGui.QLabel('Author')
        # review = QtGui.QLabel('Review')
        #
        # titleEdit = QtGui.QLineEdit()
        # authorEdit = QtGui.QLineEdit()
        # reviewEdit = QtGui.QTextEdit()
        #
        # grid = QtGui.QGridLayout()
        # grid.setSpacing(10)
        #
        # grid.addWidget(title, 1, 0)
        # grid.addWidget(titleEdit,1,1)
        #
        # grid.addWidget(author, 2, 0)
        # grid.addWidget(authorEdit,2,1)
        #
        # grid.addWidget(review, 3, 0)
        # grid.addWidget(reviewEdit,3,1,5,1)

        lcd = QtGui.QLCDNumber(self)
        sld = QtGui.QSlider(QtCore.Qt.Horizontal, self)

        vbox = QtGui.QVBoxLayout()
        vbox.addWidget(lcd)
        vbox.addWidget(sld)

        self.setLayout(vbox)
        sld.valueChanged.connect(lcd.display)

        self.setGeometry(300,300,250,150)
        # self.center()

        self.setWindowTitle('Rev')

        self.show()

    def keyPressEvent(self, e):
        if e.key() == QtCore.Qt.Key_Escape:
            self.close()


    #
    # def center(self):
    #
    #     qr = self.frameGeometry()
    #     cp = QtGui.QDesktopWidget().availableGeometry().center()
    #     qr.moveCenter(cp)
    #     self.move(qr.topLeft())

    #
    # def closeEvent(self, event):
    #
    #     reply = QtGui.QMessageBox.question(self, 'Message',
    #             "Are you sure you want to quit?", QtGui.QMessageBox.Yes
    #     | QtGui.QMessageBox.No, QtGui.QMessageBox.No)
    #
    #     event.accept() if reply == QtGui.QMessageBox.Yes else event.ignore()


def main():
    app = QtGui.QApplication(sys.argv)
    ex = Example()
    sys.exit(app.exec_())

if __name__ == '__main__':
    main()