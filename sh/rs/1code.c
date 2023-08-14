
C++ always truncates, aka rounds down

do {...} while (..);
while (..) {...};
for (.;.;.) {...};
count << "Hello";
cint >> value;
exit(0) - выход из цикла

#define MAX(a,b) (((a) > (b)) ? (a) : (b))
#define MIN(a,b) (((a) < (b)) ? (a) : (b))
#define EPSI  0.000001 // одна миллионная
#define MILLION 1000000
#define sqr(x)   ((x)*(x))
#define sign(x)  (((x) > 0) - ((x) < 0))

// elsewhere // extern bool debug;
bool allow_debug=1;
#ifdef MY_DEBUG
bool debug = true * allow_debug;
#else
bool debug = false;
#endif

enum class Indic { idle, ok, alert };
Indic com_status = Indic::idle;

Part my_struct;
my_struct = Part(); // reset

my_struct = {}; // reset (C++11)

template <typename T>
void echo(const T& arg = nullptr) {
    if (arg) {
        std::cout<<arg<<std::endl;
    } else {
    std::cout<<std::endl;
    }
}

void foo()
{
    static bool once = [](){
        cout << "once" << endl;
        return true;
    } ();
    cout << "foo" << endl;
}
// Code within lambda function is executed only once, when the static variable is initialized to the return value of lambda function. It should be thread-safe as long as your compiler support thread-safe static initialization.

std::atomic_bool work_on{true};

typedef unsigned char uchar;
quint32 === unsigned 32bit integer

using Lgrd = std::lock_guard<std::mutex>;
Lgrd lock(some_mutex);

using Clock = std::chrono::high_resolution_clock;
typedef std::chrono::milliseconds Msec;
typedef std::chrono::microseconds Usec;
typedef std::chrono::seconds Sec;
using durMs = std::chrono::duration<long, std::milli>;
using durUs = std::chrono::duration<long, std::micro>;
( std::chrono::duration_cast<Usec>( times[i]-ask_beg ) ).count()
auto ducastUs = [](auto x){return std::chrono::duration_cast<std::chrono::microseconds>(x);};

for (auto & element : vec)
{
    cout << element << " ";
}

for(iter; iter < vec.end(); iter++)
{
    cout << *iter << " ";
}


for (unsigned char* p = &buf[0]; *p; ++p)
    printf("%02x ", *p);

fflush(stdin);
<<std::flush;

ByteArray ba1{"\x38\x39\x42\x01\xA8"};
QByteArray ba2 = QByteArrayLiteral("\x38\x39\x42\x01\xA8");
Stuff::ByteArray ba3{0x38,0x39,0x42,0x01,0xA8};
const QByteArray requestData0 = QByteArray::fromHex("EE6FBB581BB000000000000000000000000000000000000000000000000005D7171B");
if (Kdebug) { kdeb << koef_hex.toHex(); }

ba1 is constructed from a C-style string literal using QByteArray::QByteArray(const char *data, int size = -1). ba2 is probably the most efficient, see QStringLiteral explained and Qt Weekly #13: QStringLiteral. For ba3 we use a small helper class that extends QByteArray:

QString::number(myNumber,16).rightJustified(5, '0');

namespace Stuff
{
    struct ByteArray: public QByteArray
    {
        ByteArray(std::initializer_list<unsigned char> lst)
            : QByteArray(reinterpret_cast<char const *>(lst.begin()), lst.size())
        {}
    };
}


//        for (unsigned char* p = &buf[0]; *p; ++p)
//            printf("%02x ", *p);
//        printf("\nadr28 has %02x\n    or dec %d\n", buf[28]);
        int dec = buf[28]; //works!
        for (int i=0; i<33; i++) {
//            printf("%02x ", buf[i]);
        }


mas = new int[n]{0}; // new array & init to zeroes

if (debug) { static int errcnt; if ( errcnt++ % 9 == 0 ) printf("stag#somestep : something=%d\n", val); }

std::function<void(void)> cb = &foo; // more simple callback

QObject::connect(timer, SIGNAL(timeout()), this, SLOT(upd_lcd_self()));
QObject::connect(ui->pb_work, &QPushButton::pressed, std::bind(&QTimer::stop, timer));

atimer->add(std::chrono::milliseconds(1600), foo, true);
atimer->add(std::chrono::milliseconds(2000), [](){foo();}, true);
atimer->add(std::chrono::milliseconds(700), [this](){this->thing_connect();}, true);

// Measure cpu time taken
time_t start, end;
time(&start);
some_function();
time(&end);
double time_taken = (double)(end-start);
printf("time taken some_function is %f seconds\n", time_taken);

// Measure realworld time taken
struct timespec start, end;
clock_gettime(CLOCK_MONOTONIC, &start);
some_function();
clock_gettime(CLOCK_MONOTONIC, &end);
double time_taken;
time_taken = (end.tv_sec - start.tv_sec) * 1e9;
time_taken = (time_taken + (end.tv_nsec - start.tv_nsec)) * 1e-9;
printf("time taken some_function is %f seconds\n", time_taken);

nanosleep((const struct timespec[]){{0, 99000000L}}, NULL); // sleep 99 ms
usleep(99000); // sleep 99 ms, reqs unistd.h
void sleep_ms(int n) { std::this_thread::sleep_for(std::chrono::milliseconds(n)); } // reqs <chrono>

std::lock_guard<std::mutex> lock(m_plan_busy);

const struct timespec read_freq_ts;
read_freq_ts.tv_sec = (long) 0;
read_freq_ts.tv_nsec = (read_freq) * 10000L;

void some_function(void * some_param)
...
int *tmp = param; int val = *tmp;
...
int some_value = *((int *) some_param

