
C++ always truncates, aka rounds down

The size of a struct is known at compile time, so it’s value can be trivially copied.
The size of an array is not known, ever, since an array is treated as a pointer.

------------------------------------------------------------

do {...} while (..);
while (..) {...};
for (.;.;.) {...};
count << "Hello";
cint >> value;
exit(0) - выход из цикла

  #define MAX(a,b) (((a) > (b)) ? (a) : (b))
  #define MIN(a,b) (((a) < (b)) ? (a) : (b))
// Minimum and maximum macros
#define __max(a,b) (((a) > (b)) ? (a) : (b))
#define __min(a,b) (((a) < (b)) ? (a) : (b))

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

assert(a == b && "A is not equal to B");
assert(("A must be equal to B", a==b));

std::string ZeroPadNumber(unsigned long int num, unsigned int N)
{
  std::stringstream ss;
  // the number is converted to string with the help of stringstream
  ss << num;
  std::string ret;
  std::string pad;
  ss >> ret;
  // Append zero chars
  int str_length = ret.length();
  for (int i = 0; i < int(N - str_length); i++)
    pad += "0";
  return pad + ret;
}


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

uint32_t EndianConverse(uint32_t arg)
{
   return ((arg>>24)&0x000000FF) | ((arg>> 8)&0x0000FF00) |
          ((arg<< 8)&0x00FF0000) | ((arg<<24)&0xFF000000);
}

using Lgrd = std::lock_guard<std::mutex>;
Lgrd lock(some_mutex);

std::lock_guard<std::mutex> lock(m_plan_busy);
std::lock_guard lock(m_plan_busy);

using Clock = std::chrono::high_resolution_clock;
typedef std::chrono::milliseconds Msec;
typedef std::chrono::microseconds Usec;
typedef std::chrono::seconds Sec;
using durMs = std::chrono::duration<long, std::milli>;
using durUs = std::chrono::duration<long, std::micro>;
( std::chrono::duration_cast<Usec>( times[i]-ask_beg ) ).count()
auto durCastMcs = [](auto x){return std::chrono::duration_cast<std::chrono::microseconds>(x);};
auto durCastMS = [](auto x){return std::chrono::duration_cast<std::chrono::milliseconds>(x);};
auto zero_tp = std::chrono::steady_clock::time_point (std::chrono::milliseconds(0)
)

for (auto & element : vec)
{
    cout << element << " ";
}

for (iter; iter < vec.end(); iter++)
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
std::cout << koef_hex.toHex().toStdString();

void reversBytesBy(uint8_t* data, int N) {
    if (N <= 0) {return;}
    int steps = std::ceil((float)def_MAX_MICBUS_IN_ETH_SIZE / N);
    // reverse every 'N' amount of bytes
    for (int i = 0; i < steps; i++) {
        for (int ii = 0; ii < N / 2; ii++) {
            int i1 = i * N + ii;
            int i2 = i * N + N - 1 - ii;
            uint8_t zeroval = 0;
            if (i1 < def_MAX_MICBUS_IN_ETH_SIZE) {
                std::swap(data[i1], i2 < def_MAX_MICBUS_IN_ETH_SIZE ? data[i2] : zeroval);
            }
        }
    }
}

void reverseBytearray(QByteArray& ba, int dist) {
	if (ba.size() == 0 || dist<2 )
		return;
	// Добить нулями до размера 'dist'
	int tail = ba.size() % dist;
	if (tail > 0) {
		//QByteArray addendum = QByteArray(dist - tail, 0x00);
		ba.append(dist-tail,0x00);
	}
	// Развернуть каждый кусок размером в 'dist' байтов
	int parts = ba.size() / dist;
	for (int i = 0; i < parts; i++) {
		std::reverse(ba.begin() + dist * i, ba.begin() + dist * (i + 1));
	}
}

void reverse8bits(unsigned char& b) {
	b = (b & 0xF0) >> 4 | (b & 0x0F) << 4;
	b = (b & 0xCC) >> 2 | (b & 0x33) << 2;
	b = (b & 0xAA) >> 1 | (b & 0x55) << 1;
}
void reverse8bits(QByteArray& ba) {
	// reverse bits inside every byte
	int size = ba.size();
	for (int i = 0; i < size; i++) {
		char& element = ba[i];
		unsigned char& element_uc = reinterpret_cast<unsigned char&>(element);
		reverse8bits(element_uc);
	}
}

quint32 byteArrayToUint32(const QByteArray& ba)
{
	auto count = ba.size();
	if (count == 0 || count > 4) {
		return 0; // BAD!
	}
	quint32 number = 0U;
	for (int i = 0; i < count; ++i) {
		auto b = static_cast<quint8>(ba[count - 1 - i]);
		number += static_cast<quint32>(b << (8 * i));
	}
	return number;
}

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

const struct timespec read_freq_ts;
read_freq_ts.tv_sec = (long) 0;
read_freq_ts.tv_nsec = (read_freq) * 10000L;

void some_function(void * some_param)
...
int *tmp = param; int val = *tmp;
...
int some_value = *((int *) some_param


How do you initialize a “std::shared_ptr” in C++?
-------------
Kurt Guntheroth:
    using namespace std; 
    shared_ptr<Foo>p1;           // default init to nullptr 
    shared_ptr<Foo>p2 = nullptr; // init to nullptr 
    shared_ptr<Foo>p3(new FOO);  // init to dynamic storage 
    shared_ptr<Foo>p4 = p3;      // share with another shared_ptr 
    auto p5 = make_shared<Foo>();// preferred 

Line 6 is preferred because it allocates both the Foo instance and the shared_ptr’s reference count in the same block, which is faster.
shared_ptr uses expensive thread-safe increment and decrement to maintain its reference counts.
Before move semantics in C++11, shared_ptr was the only way to put non-copyable objects in a standard library container. This made shared_ptr relatively common, and some coding standards said every pointer should be a shared_ptr. With move semantics, non-copyable objects can be in containers, and unique_ptr can be used practically all the time. The only time shared_ptr is needed nowadays is in the rare event that the lifetimes of two pointers overlap unpredictably.
