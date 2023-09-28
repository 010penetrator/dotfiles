
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

bool test = true;
QString s = QVariant(test).toString(); // "true"

QSettings settings("setting_commandExecuter.ini", QSettings::IniFormat);
QStringList keys = settings.allKeys();
for (int i = 0; i < keys.size(); i++) {
    auto k = keys.at(i).toUtf8();
    QString ks(k);
    std::cout << i << " " << k.toStdString() << " " << settings.value(k).toString().toStdString() << std::endl;
    //if (ks == "devId") { m_devId = settings.value(k).toString().toInt(); }
}
//if (settings.contains("devId")) { m_devId = settings.value("devId").toString().toInt(); }
m_LuaExec = settings.value("Exec/Lua").toString();
m_devId = settings.value("devId").toString().toInt();




