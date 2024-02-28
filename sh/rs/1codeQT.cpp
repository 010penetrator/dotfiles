
QObject::connect(timer, SIGNAL(timeout()), this, SLOT(upd_lcd_self()));
QObject::connect(ui->pb_work, &QPushButton::pressed, std::bind(&QTimer::stop, timer));
QObject::connect(pw, &SoWorker::ulov, [&](bool ulov) {
        printf(ulov) });

QTimer::singleShot(50, this, [&]() {
    //do stuff
    });

QTimer::singleShot(50, this, [&]() { fun(); });

QString qq = QString::fromUtf8(u8"фыва");

uint64_t thid = (uint64_t)QThread::currentThreadId();
QString thstr(" @ th_" + QString::number(thid));

m_ipEdit = new QLineEdit(this);
QString IpRange = "(?:[0-1]?[0-9]?[0-9]|2[0-4][0-9]|25[0-5])";
QRegularExpression IpRegex("^" + IpRange
    + "(\\." + IpRange + ")"
    + "(\\." + IpRange + ")"
    + "(\\." + IpRange + ")$");
QRegularExpressionValidator* ipValidator = new QRegularExpressionValidator(IpRegex, this);
m_ipEdit->setValidator(ipValidator);
//
auto portValidator = new QIntValidator(1, 65535, this);
m_portEdit->setValidator(portValidator);

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

QTextStream data(&m_File);
data << text + '\n';

void TNDiag::slot_sayFail() {
    // Сообщать о фэйле не чаще раз в 3 сек
    static auto tpPrev = std::chrono::steady_clock::time_point(std::chrono::milliseconds(0));
    auto tpNow = std::chrono::steady_clock::now();
    long int dur_ms = std::chrono::duration_cast<std::chrono::milliseconds>(tpNow - tpPrev).count();
    tpPrev = tpNow;
    if (dur_ms > 3000) {
        QMessageBox::information(NULL, QString("Ошибка"), QString("Нет ответа от прибора"));
    }
}