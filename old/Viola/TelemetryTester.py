__author__ = 'ssven'
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
        telem_combo = QtGui.QComboBox(self)
        telem_combo.addItem("Power Telemetry")
        telem_combo.addItem("CMG Housekeeping")


        type_combo = QtGui.QComboBox(self)
        type_combo.addItem("Random")
        type_combo.addItem("Sequenced")

        # combo.activated[str].connect(self.onActivated)

        btn1 = QtGui.QPushButton('Send Telem',self)
        btn1.clicked.connect(self.buttonClicked)
        #basic text enrtry
        Telem = QtGui.QLabel('Telemetry')
        Type = QtGui.QLabel('Random or Sequenced')



        grid = QtGui.QGridLayout()
        grid.setSpacing(10)

        grid.addWidget(Telem, 1, 0)
        grid.addWidget(telem_combo,1,1)

        grid.addWidget(Type, 2, 0)
        grid.addWidget(type_combo,2,1)

        grid.addWidget(btn1)


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


        #
        # btn2 = QtGui.QPushButton("Button 2", self)
        # btn2.move(150,50)
        #

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
        self.setLayout(grid)
        self.resize(500,300)
        self.center()

        self.setWindowTitle('Telemetry Tester')

        self.show()



    def buttonClicked(self):
        sender = self.sender()
        self.statusBar().showMessage(sender.text() + ' was pressed')
    #
    # def keyPressEvent(self, e):
    #     if e.key() == QtCore.Qt.Key_Escape:
    #         self.close()

    # def showDialog(self):
    #
    #     text, ok = QtGui.QInputDialog.getText(self, 'Input Dialog',
    #         'Enter your name: ')
    #
    #     if ok:
    #         self.le.setText(str(text))



    def center(self):

        qr = self.frameGeometry()
        cp = QtGui.QDesktopWidget().availableGeometry().center()
        qr.moveCenter(cp)
        self.move(qr.topLeft())



def main():
    app = QtGui.QApplication(sys.argv)
    ex = Example()
    sys.exit(app.exec_())

if __name__ == '__main__':
    main()