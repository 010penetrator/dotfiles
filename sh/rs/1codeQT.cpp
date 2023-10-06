
QObject::connect(timer, SIGNAL(timeout()), this, SLOT(upd_lcd_self()));
QObject::connect(ui->pb_work, &QPushButton::pressed, std::bind(&QTimer::stop, timer));

QTimer::singleShot(50, this, [&]() {
    //do stuff
    });

QTimer::singleShot(50, this, [&]() { fun(); });
        
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

   
if (!QFileInfo::exists(scce->m_pythScriptDef))
{
    scce->m_fileSet = false;
    QString userInputString;
    if (!scce->m_fileSet) {
        userInputString = QFileDialog::getOpenFileName(nullptr,
            tr("Open script to execute"), ".", tr("*.py"));
    }
    if (!userInputString.isEmpty()) {
        scce->m_pythScriptDef = userInputString;
        scce->m_fileSet = true;
    }
}

std::tuple<QString, QString> TNDiag::LuaCall(QString scriptfilename, QString args) {
    const QString LuaExecPath("../third_part/Lua/lua54.exe");

    QProcess cmd;
    QProcessEnvironment env = QProcessEnvironment::systemEnvironment();
    QProcessEnvironment envUpdate;
    envUpdate.insert("PATH", env.value("PATH"));
    cmd.setProcessEnvironment(envUpdate);

    args = args.simplified(); //remove excessive whitespaces
    QStringList arglist = args.split(' ');
    arglist = QStringList(scriptfilename) + arglist;
    //QString diag_cwd = QDir::currentPath();

    cmd.start(LuaExecPath, arglist);
    cmd.waitForFinished();
    QString stdout_ = cmd.readAll();
    QString stderr_ = cmd.readAllStandardError();

    return std::make_tuple(stdout_, stderr_);
}
