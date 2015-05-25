__author__ = 'ssven'

import sys
from PyQt4 import QtGui, QtCore

class Communicate(QtCore.QObject):

    closeApp = QtCore.pyqtSignal()


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
        #
        # # cool count down style clock
        # lcd = QtGui.QLCDNumber(self)
        # sld = QtGui.QSlider(QtCore.Qt.Horizontal, self)
        #
        # vbox = QtGui.QVBoxLayout()
        # vbox.addWidget(lcd)
        # vbox.addWidget(sld)
        #
        # self.setLayout(vbox)
        # sld.valueChanged.connect(lcd.display)

        # #Buttons send text to status bar
        # btn1 = QtGui.QPushButton('Button 1',self)
        # btn1.move(30,50)
        #
        # btn2 = QtGui.QPushButton("Button 2", self)
        # btn2.move(150,50)
        #
        # btn1.clicked.connect(self.buttonClicked)
        # btn2.clicked.connect(self.buttonClicked)
        #
        # self.statusBar()


        # #Send signals
        # self.c = Communicate()
        # self.c.closeApp.connect(self.close)

        # Text stuff
        # self.btn = QtGui.QPushButton('Dialog', self)
        # self.btn.move(20,20)
        # self.btn.clicked.connect(self.showDialog)
        #
        # self.le = QtGui.QLineEdit(self)
        # self.le.move(130,22)

        self.lbl = QtGui.QLabel("Power Telemetry")
        combo = QtGui.QComboBox(self)
        combo.addItem("Power Telemetry")
        combo.addItem("CMG Housekeeping")

        combo.move(50,50)
        self.lbl.move(50,150)

        combo.activated[str].connect(self.onActivated)


        self.setGeometry(300,300,300,200)
        # self.center()

        self.setWindowTitle('Input Dialog')

        self.show()

    def onActivated(self, text):
        self.lbl.setText(text)
        self.lbl.adjustSize()
    # def buttonClicked(self):
    #     sender = self.sender()
    #     self.statusBar().showMessage(sender.text() + ' was pressed')
    #
    # def keyPressEvent(self, e):
    #     if e.key() == QtCore.Qt.Key_Escape:
    #         self.close()

    # def mousePressEvent(self, event):
    #     self.c.closeApp.emit()

    # def showDialog(self):
    #
    #     text, ok = QtGui.QInputDialog.getText(self, 'Input Dialog',
    #         'Enter your name: ')
    #
    #     if ok:
    #         self.le.setText(str(text))


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