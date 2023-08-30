
QObject::connect(timer, SIGNAL(timeout()), this, SLOT(upd_lcd_self()));
QObject::connect(ui->pb_work, &QPushButton::pressed, std::bind(&QTimer::stop, timer));


QFrame* CommandExecuterGui::composeHorizLine(int h = 2) {
    auto result = new QFrame();
    result->setFrameShape(QFrame::HLine);
    result->setFrameShadow(QFrame::Sunken);
    result->setFixedHeight(h);
    result->setStyleSheet(QString("background-color: #666;"));
    return result;
}

