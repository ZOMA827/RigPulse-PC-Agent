import 'dart:async';
import 'dart:convert';
import 'dart:math' as math; // 👈 ضيف هذا السطر لملف main.dart الفوق كامل!
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:percent_indicator/percent_indicator.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart'; // 👈 إضافة مكتبة المصادقة هنا

import 'login_screen.dart';
import 'app_strings.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await Firebase.initializeApp();
    print("🚀 Cloud Firebase Services Connected!");
  } catch (e) {
    print("⚠️ Firebase Bypass Active: Running in Local Developer Mode.");
  }
  runApp(const RigPulseApp());
}

class RigPulseApp extends StatelessWidget {
  const RigPulseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RigPulse PRO',
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF030508),
        primaryColor: const Color(0xFF00F5FF),
        fontFamily: 'Rajdhani',
      ),
      home: const SplashScreen(), // 👈 إقلاع التطبيق من الشاشة الكاذبة الذكية
    );
  }
}

// =============================================
// 🎬 🚀 الشاشة الكاذبة الجبارة (SPLASH HUD MULTI-DOT)
// =============================================
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _dotsController;

  @override
  void initState() {
    super.initState();
    // أنيميشن النيون للنقاط الثلاثة المتحركة (مثل فيسبوك والألعاب)
    _dotsController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    )..repeat();

    _checkUserSession();
  }

  // 🧠 دالة الفحص الصامت والذكية في الخلفية
  Future<void> _checkUserSession() async {
    // ننتظر ثانيتين برك باش نخلو الأنيميشن الأسطوري يبان للجيمر كيما يحب الخاطر
    await Future.delayed(const Duration(seconds: 2));

    // الفحص الحقيقي من سيرفر الفايربيس
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      print(
          "🎯 Silent Auth Approved: Welcome Back Commander ${user.displayName}");
      // إذا مسجل ديجا، تخطي شاشة اللوجن واصدم ديريكت للداشبورد!
      navigatorKey.currentState?.pushReplacement(
        MaterialPageRoute(builder: (_) => const MainContainer()),
      );
    } else {
      print("🔒 No Session Found: Redirecting to Clearance Gate.");
      // إذا مستخدم جديد، ديه لصفحة تسجيل الدخول بجوجل
      navigatorKey.currentState?.pushReplacement(
        MaterialPageRoute(builder: (_) => const LoginScreen()),
      );
    }
  }

  @override
  void dispose() {
    _dotsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF030508),
      body: Stack(
        children: [
          // خلفية هولوجرامية خفيفة للـ Splash
          Positioned(
            top: -50,
            left: -50,
            child: Container(
                width: 250,
                height: 250,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: const Color(0xFF00F5FF).withOpacity(0.03),
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 100,
                          color: const Color(0xFF00F5FF).withOpacity(0.05))
                    ])),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // لوجو الردار مشع في وسط الشاشة الكاذبة
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(shape: BoxShape.circle, boxShadow: [
                    BoxShadow(
                        color: const Color(0xFF00F5FF).withOpacity(0.1),
                        blurRadius: 30,
                        spreadRadius: 2)
                  ]),
                  child: const Icon(Icons.radar,
                      size: 65, color: Color(0xFF00F5FF)),
                ),
                const SizedBox(height: 24),
                const Text(
                  'RIGPULSE',
                  style: TextStyle(
                      fontFamily: 'Orbitron',
                      fontSize: 26,
                      fontWeight: FontWeight.w900,
                      color: Colors.white,
                      letterSpacing: 6),
                ),
                const SizedBox(height: 8),
                const Text(
                  'SECURING SECURE CLOUD LINK...',
                  style: TextStyle(
                      fontFamily: 'Rajdhani',
                      fontSize: 11,
                      color: Color(0xFFB4FF4E),
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2),
                ),
                const SizedBox(height: 30),

                // 🛑 ثلاث نقاط نيون صاعدة وهابطة تفاعلية (التغطية الشنيعة المطلوبة)
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(3, (index) {
                    return AnimatedBuilder(
                      animation: _dotsController,
                      builder: (context, child) {
                        // معادلة جيبية (Sine Wave) لإنشاء حركة تموج النقاط المتتالية بالترتيب
                        double delay = index * 0.3;
                        double value = math
                            .sin((_dotsController.value * math.pi * 2) - delay);
                        return Container(
                          margin: const EdgeInsets.symmetric(horizontal: 5),
                          width: 10,
                          height: 10,
                          transform: Matrix4.translationValues(
                              0, value * 8, 0), // حركة صعود ونزول ناعمة
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: const Color(0xFF00F5FF)
                                  .withOpacity(value.clamp(0.2, 1.0)),
                              boxShadow: [
                                BoxShadow(
                                    color: const Color(0xFF00F5FF)
                                        .withOpacity(0.4),
                                    blurRadius: 8,
                                    spreadRadius: 1)
                              ]),
                        );
                      },
                    );
                  }),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// 👈 ملاحظة: تأكد من إضافة سطر import 'dart:math' as math; الفوق كامل في ملف main.dart باش تخدم المعادلة الجيبية للنقاط!

// ... كمل باقي كود main.dart القديم كامل تاعك لتحت (N, SystemMetrics, الخ) بلا ما تمس حتى حرف ...
// ... كمل باقي كود main.dart القديم كامل تاعك لتحت بلا ما تحذف ولا حرف ...

// =============================================
// ============  COLORS & CONSTANTS  ===========
// =============================================
class N {
  static const cyan = Color(0xFF00F5FF);
  static const orange = Color(0xFFFF6B2B);
  static const green = Color(0xFFB4FF4E);
  static const purple = Color(0xFFC77DFF);
  static const red = Color(0xFFFF3D3D);
  static const yellow = Color(0xFFFFD60A);
  static const bg = Color(0xFF030508);
  static const card = Color(0xFF0A0F18);
  static const border = Color(0xFF1A2535);
  static const muted = Color(0xFF7A8BA0);
  static const text = Color(0xFFE8F0FF);
  static const subtext = Color(0xFFA0B0C8);
}

// =============================================
// ============  SHARED DATA MODEL  ============
// =============================================
class SystemMetrics {
  final double cpuUsage, cpuTemp, cpuGhz;
  final double gpuUsage, gpuTemp;
  final String gpuName;
  final double vramUsed, vramTotal;
  final double ramPercent, ramUsed, ramTotal;
  final double fps, ping, diskTemp, moboTemp;
  final double cpuFan, gpuFan;
  final double cpuWatt, gpuWatt;

  const SystemMetrics({
    this.cpuUsage = 0,
    this.cpuTemp = 0,
    this.cpuGhz = 0,
    this.gpuUsage = 0,
    this.gpuTemp = 0,
    this.gpuName = 'GPU',
    this.vramUsed = 0,
    this.vramTotal = 1,
    this.ramPercent = 0,
    this.ramUsed = 0,
    this.ramTotal = 16,
    this.fps = 0,
    this.ping = 0,
    this.diskTemp = 0,
    this.moboTemp = 0,
    this.cpuFan = 0,
    this.gpuFan = 0,
    this.cpuWatt = 0,
    this.gpuWatt = 0,
  });

  factory SystemMetrics.fromJson(Map<String, dynamic> d) {
    final cpu = d['cpu'] as Map<String, dynamic>? ?? {};
    final gpu = d['gpu'] as Map<String, dynamic>? ?? {};
    final ram = d['ram'] as Map<String, dynamic>? ?? {};
    final net = d['network'] as Map<String, dynamic>? ?? {};
    return SystemMetrics(
      cpuUsage: (cpu['usage'] ?? 0).toDouble(),
      cpuTemp: (cpu['temp'] ?? 0).toDouble(),
      cpuGhz: (cpu['ghz'] ?? 0).toDouble(),
      cpuFan: (cpu['fan'] ?? 0).toDouble(),
      cpuWatt: (cpu['watt'] ?? 0).toDouble(),
      gpuUsage: (gpu['usage'] ?? 0).toDouble(),
      gpuTemp: (gpu['temp'] ?? 0).toDouble(),
      gpuName: gpu['name'] ?? 'GPU',
      vramUsed: (gpu['vram_used'] ?? 0).toDouble(),
      vramTotal: (gpu['vram_total'] ?? 1).toDouble(),
      gpuFan: (gpu['fan'] ?? 0).toDouble(),
      gpuWatt: (gpu['watt'] ?? 0).toDouble(),
      ramPercent: (ram['percent'] ?? 0).toDouble(),
      ramUsed: (ram['used_gb'] ?? 0).toDouble(),
      ramTotal: (ram['total_gb'] ?? 16).toDouble(),
      ping: (net['ping_ms'] ?? 0).toDouble(),
      diskTemp: (d['disk_temp'] ?? 0).toDouble(),
      moboTemp: (d['mobo_temp'] ?? 38).toDouble(),
      fps: (d['fps'] ?? 0).toDouble(),
    );
  }
}

// =============================================
// =============  HOLOGRAM WIDGET  =============
// =============================================
class HoloCard extends StatelessWidget {
  final Widget child;
  final Color glowColor;
  final double padding;

  const HoloCard(
      {super.key,
      required this.child,
      this.glowColor = N.cyan,
      this.padding = 12.0});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 400),
          padding: EdgeInsets.all(padding),
          decoration: BoxDecoration(
            color: N.card.withOpacity(0.5),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: glowColor.withOpacity(0.25), width: 1.2),
            boxShadow: [
              BoxShadow(
                  color: glowColor.withOpacity(0.03),
                  blurRadius: 15,
                  spreadRadius: 1)
            ],
          ),
          child: child,
        ),
      ),
    );
  }
}

// =============================================
// ==================  MAIN SPA CONTAINER  ==============
// =============================================
class MainContainer extends StatefulWidget {
  const MainContainer({super.key});
  @override
  State<MainContainer> createState() => _MainContainerState();
}

class _MainContainerState extends State<MainContainer>
    with SingleTickerProviderStateMixin {
  late IO.Socket socket;
  SystemMetrics _metrics = const SystemMetrics();
  bool _connected = false;
  String _currentScreen = 'home';
  bool _isAlarmActive = false;
  late AnimationController _alarmController;

  final String serverUrl = 'http://192.168.37.92:5000';

  @override
  void initState() {
    super.initState();
    _alarmController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500))
      ..repeat(reverse: true);
    _initSocket();
  }

  void _initSocket() {
    socket = IO.io(serverUrl, <String, dynamic>{
      'transports': ['websocket'],
      'autoConnect': true,
    });
    socket.onConnect((_) => setState(() => _connected = true));
    socket.onDisconnect((_) => setState(() => _connected = false));
    socket.on('metrics_update', (data) {
      if (mounted) {
        setState(() {
          _metrics = SystemMetrics.fromJson(Map<String, dynamic>.from(data));
          _checkAlarms();
        });
      }
    });
  }

  void _checkAlarms() {
    if (_metrics.cpuTemp >= 85 || _metrics.gpuTemp >= 88) {
      if (!_isAlarmActive) setState(() => _isAlarmActive = true);
      HapticFeedback.heavyImpact();
    } else {
      if (_isAlarmActive) setState(() => _isAlarmActive = false);
    }
  }

  @override
  void dispose() {
    _alarmController.dispose();
    socket.dispose();
    super.dispose();
  }

  void _navigateTo(String screen) {
    setState(() => _currentScreen = screen);
  }

  Future<void> _killPcAgent() async {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: N.bg,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
            side: BorderSide(color: N.red.withOpacity(0.5), width: 2)),
        title: Row(
          children: [
            const Icon(Icons.warning_amber_rounded, color: N.red),
            const SizedBox(width: 10),
            Text(AppStrings.tr('self_destruct'),
                style: const TextStyle(
                    fontFamily: 'Orbitron',
                    color: N.red,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1)),
          ],
        ),
        content: Text(AppStrings.tr('kill_warning'),
            style: const TextStyle(
                fontFamily: 'Rajdhani', color: N.text, fontSize: 16)),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text(AppStrings.tr('cancel'),
                  style:
                      const TextStyle(color: N.muted, fontFamily: 'Orbitron'))),
          Container(
            decoration: BoxDecoration(
                color: N.red.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: N.red)),
            child: TextButton(
              onPressed: () async {
                Navigator.pop(context);
                try {
                  await http.post(Uri.parse('$serverUrl/shutdown_agent'));
                } catch (_) {}
              },
              child: Text(AppStrings.tr('kill_agent'),
                  style: const TextStyle(
                      color: N.red,
                      fontFamily: 'Orbitron',
                      fontWeight: FontWeight.bold)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBackground() {
    return Stack(
      children: [
        Positioned(
          top: -100,
          left: -50,
          child: Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: N.cyan.withOpacity(0.04),
                  boxShadow: [
                    BoxShadow(blurRadius: 100, color: N.cyan.withOpacity(0.08))
                  ])),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    // 🛡️ الميزة المطلوبة 1: حماية زر الرجوع (Android Back Button)
    return PopScope(
      canPop: _currentScreen == 'home',
      onPopInvoked: (bool didPop) {
        if (!didPop) {
          setState(() {
            _currentScreen = 'home'; // يرجعك للواجهة الرئيسية وما يخرجش
          });
        }
      },
      // 🌐 التوجيه التلقائي للنصوص: ينقلب التطبيق من اليمين لليسار إذا ختار العربية
      child: Directionality(
        textDirection: AppStrings.currentLang == 'AR'
            ? TextDirection.rtl
            : TextDirection.ltr,
        child: Scaffold(
          backgroundColor: N.bg,
          body: Stack(
            children: [
              _buildBackground(),
              if (_isAlarmActive)
                AnimatedBuilder(
                  animation: _alarmController,
                  builder: (context, child) {
                    return Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: N.red
                                    .withOpacity(_alarmController.value * 0.7),
                                width: 6),
                            color: N.red
                                .withOpacity(_alarmController.value * 0.08)));
                  },
                ),
              SafeArea(
                child: Column(
                  children: [
                    _buildHeader(),
                    Expanded(child: _buildCurrentScreen()),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: N.cyan.withOpacity(0.08)))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _currentScreen != 'home'
              ? IconButton(
                  icon: Icon(
                      AppStrings.currentLang == 'AR'
                          ? Icons.chevron_right
                          : Icons.chevron_left,
                      color: N.cyan,
                      size: 26),
                  onPressed: () => _navigateTo('home'))
              : const SizedBox(width: 48),
          Column(
            children: [
              Text('RIGPULSE',
                  style: TextStyle(
                      fontFamily: 'Orbitron',
                      fontSize: 18,
                      fontWeight: FontWeight.w900,
                      letterSpacing: 5,
                      color: N.cyan,
                      shadows: [
                        Shadow(color: N.cyan.withOpacity(0.8), blurRadius: 12)
                      ])),
              const Text('PRO HUD v2.0',
                  style: TextStyle(
                      fontFamily: 'Rajdhani',
                      fontSize: 9,
                      letterSpacing: 3,
                      color: N.green)),
            ],
          ),
          Row(
            children: [
              // 🌐 الميزة المطلوبة 2: زر تغيير اللغة
              GestureDetector(
                onTap: () {
                  setState(() {
                    AppStrings.toggleLang();
                  });
                },
                child: Container(
                  margin: const EdgeInsets.only(right: 8, left: 8),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                  decoration: BoxDecoration(
                      color: N.purple.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(6),
                      border: Border.all(color: N.purple.withOpacity(0.4))),
                  child: Text(AppStrings.currentLang == 'EN' ? 'AR' : 'EN',
                      style: const TextStyle(
                          color: N.purple,
                          fontWeight: FontWeight.bold,
                          fontSize: 10,
                          fontFamily: 'Orbitron')),
                ),
              ),
              if (_connected)
                GestureDetector(
                  onTap: _killPcAgent,
                  child: Container(
                    margin: const EdgeInsets.only(right: 8, left: 8),
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                        color: N.red.withOpacity(0.1),
                        shape: BoxShape.circle,
                        border: Border.all(color: N.red.withOpacity(0.4))),
                    child: const Icon(Icons.power_settings_new_rounded,
                        color: N.red, size: 16),
                  ),
                ),
              AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                width: 7,
                height: 7,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _connected ? N.green : N.red),
              ),
              const SizedBox(width: 4),
              Text(
                  _connected
                      ? AppStrings.tr('synced')
                      : AppStrings.tr('offline'),
                  style: TextStyle(
                      fontFamily: 'Rajdhani',
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      color: _connected ? N.green : N.red)),
              const SizedBox(width: 6),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCurrentScreen() {
    switch (_currentScreen) {
      case 'monitor':
        return LiveMonitorView(metrics: _metrics);
      case 'tasks':
        return TaskManagerView(apiUrl: serverUrl);
      case 'optimizer':
        return const GameOptimizerView();
      case 'alerts':
        return SmartAlertsView(metrics: _metrics);
      default:
        return _buildHomeView();
    }
  }

  Widget _buildHomeView() {
    Color maxTempColor = N.cyan;
    if (_metrics.cpuTemp > 80 || _metrics.gpuTemp > 85) maxTempColor = N.red;

    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      child: Column(
        children: [
          Row(
            children: [
              _quickStat(
                  'CPU', '${_metrics.cpuUsage.toStringAsFixed(0)}%', N.cyan),
              const SizedBox(width: 6),
              _quickStat(
                  'GPU', '${_metrics.gpuUsage.toStringAsFixed(0)}%', N.orange),
              const SizedBox(width: 6),
              _quickStat(AppStrings.tr('live_fps'),
                  _metrics.fps.toStringAsFixed(0), N.green),
            ].map((w) => Expanded(child: w)).toList(),
          ),
          const SizedBox(height: 10),
          GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 1.05,
            children: [
              _buildGridCard(
                  '⚡',
                  AppStrings.tr('live_hud'),
                  AppStrings.tr('real_time_stats'),
                  N.cyan,
                  () => _navigateTo('monitor')),
              _buildGridCard(
                  '🗂️',
                  AppStrings.tr('processes'),
                  AppStrings.tr('grouped_kill'),
                  N.purple,
                  () => _navigateTo('tasks')),
              _buildGridCard(
                  '🎮',
                  AppStrings.tr('ai_optimizer'),
                  AppStrings.tr('neural_core'),
                  N.green,
                  () => _navigateTo('optimizer')),
              _buildGridCard(
                  '🔔',
                  AppStrings.tr('alerts_config'),
                  AppStrings.tr('vib_thresh'),
                  N.yellow,
                  () => _navigateTo('alerts')),
            ],
          ),
          const SizedBox(height: 12),
          HoloCard(
            glowColor: maxTempColor,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(AppStrings.tr('session_overview'),
                    style: const TextStyle(
                        fontFamily: 'Orbitron',
                        fontSize: 9,
                        color: N.cyan,
                        letterSpacing: 1.5)),
                const SizedBox(height: 10),
                GridView.count(
                  crossAxisCount: 3,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  childAspectRatio: 2.3,
                  children: [
                    (AppStrings.tr('runtime'), '01:24:37', N.muted),
                    (
                      AppStrings.tr('max_cpu'),
                      '${_metrics.cpuTemp.toStringAsFixed(0)}°C',
                      _metrics.cpuTemp > 80 ? N.red : N.cyan
                    ),
                    (
                      AppStrings.tr('max_gpu'),
                      '${_metrics.gpuTemp.toStringAsFixed(0)}°C',
                      _metrics.gpuTemp > 85 ? N.red : N.orange
                    ),
                    (
                      AppStrings.tr('avg_fps'),
                      _metrics.fps.toStringAsFixed(0),
                      N.green
                    ),
                    (
                      AppStrings.tr('net_ping'),
                      '${_metrics.ping.toStringAsFixed(0)}ms',
                      N.cyan
                    ),
                    (
                      AppStrings.tr('vram_alloc'),
                      '${(_metrics.vramUsed / 1024).toStringAsFixed(1)}G',
                      N.purple
                    ),
                  ]
                      .map((s) => Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(s.$1,
                                  style: const TextStyle(
                                      fontFamily: 'Rajdhani',
                                      fontSize: 10,
                                      color: N.subtext)),
                              Text(s.$2,
                                  style: TextStyle(
                                      fontFamily: 'Rajdhani',
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: s.$3)),
                            ],
                          ))
                      .toList(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _quickStat(String label, String val, Color color) {
    return HoloCard(
      glowColor: color,
      padding: 10,
      child: Column(
        children: [
          Text(label,
              style: const TextStyle(
                  fontFamily: 'Orbitron', fontSize: 9, color: N.muted)),
          const SizedBox(height: 2),
          Text(val,
              style: TextStyle(
                  fontFamily: 'Rajdhani',
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                  color: color,
                  shadows: [
                    Shadow(color: color.withOpacity(0.5), blurRadius: 10)
                  ])),
        ],
      ),
    );
  }

  Widget _buildGridCard(
      String icon, String title, String desc, Color color, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: HoloCard(
        glowColor: color,
        padding: 14,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(icon, style: const TextStyle(fontSize: 28)),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: TextStyle(
                        fontFamily: 'Orbitron',
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                        color: color)),
                const SizedBox(height: 2),
                Text(desc,
                    style: const TextStyle(
                        fontFamily: 'Rajdhani',
                        fontSize: 10,
                        color: N.subtext,
                        height: 1.2)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// =============================================
// ===========  LIVE MONITOR VIEW  =============
// =============================================
class LiveMonitorView extends StatefulWidget {
  final SystemMetrics metrics;
  const LiveMonitorView({super.key, required this.metrics});

  @override
  State<LiveMonitorView> createState() => _LiveMonitorViewState();
}

class _LiveMonitorViewState extends State<LiveMonitorView> {
  String _selectedMode = 'GAME';

  Widget _buildOperationModeSelector() {
    return HoloCard(
      glowColor: N.purple,
      padding: 8,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          AppStrings.tr('silent_mode'),
          AppStrings.tr('game_mode'),
          AppStrings.tr('overclock_mode')
        ].map((mode) {
          bool isSel = _selectedMode == mode;
          Color mColor = mode == AppStrings.tr('silent_mode')
              ? N.green
              : (mode == AppStrings.tr('game_mode') ? N.cyan : N.red);
          return GestureDetector(
            onTap: () => setState(() => _selectedMode = mode),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                  color: isSel ? mColor.withOpacity(0.15) : Colors.transparent,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                      color: isSel ? mColor : Colors.transparent, width: 1)),
              child: Text('$mode ${AppStrings.tr('mode_suffix')}',
                  style: TextStyle(
                      fontFamily: 'Orbitron',
                      fontSize: 9,
                      fontWeight: FontWeight.bold,
                      color: isSel ? mColor : N.muted)),
            ),
          );
        }).toList(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double maxTemp = widget.metrics.cpuTemp > widget.metrics.gpuTemp
        ? widget.metrics.cpuTemp
        : widget.metrics.gpuTemp;
    Color aiColor = maxTemp < 60 ? N.green : (maxTemp < 80 ? N.orange : N.red);
    String aiStatus = maxTemp < 60
        ? AppStrings.tr('optimal')
        : (maxTemp < 80
            ? AppStrings.tr('high_load')
            : AppStrings.tr('overheating'));

    Color dynamicCpuColor = widget.metrics.cpuTemp > 80
        ? N.red
        : (widget.metrics.cpuTemp > 65 ? N.orange : N.cyan);
    Color dynamicGpuColor = widget.metrics.gpuTemp > 85
        ? N.red
        : (widget.metrics.gpuTemp > 70 ? N.orange : N.purple);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Column(
        children: [
          _buildOperationModeSelector(),
          const SizedBox(height: 8),
          HoloCard(
            glowColor: N.green,
            padding: 8,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(widget.metrics.fps.toStringAsFixed(0),
                    style: TextStyle(
                        fontFamily: 'Rajdhani',
                        fontSize: 44,
                        fontWeight: FontWeight.w900,
                        color: N.text,
                        shadows: [
                          Shadow(
                              color: N.green.withOpacity(0.6), blurRadius: 15)
                        ])),
                const SizedBox(width: 6),
                Text(AppStrings.tr('fps_core'),
                    style: const TextStyle(
                        fontFamily: 'Orbitron',
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: N.green,
                        letterSpacing: 2)),
                const Spacer(),
                Icon(Icons.radar, color: aiColor, size: 16),
                const SizedBox(width: 6),
                Text('${AppStrings.tr('pulse')}: $aiStatus',
                    style: TextStyle(
                        fontFamily: 'Orbitron',
                        fontSize: 10,
                        color: aiColor,
                        fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                  child: _CompactGauge(
                      title: AppStrings.tr('cpu_core'),
                      valuePct: widget.metrics.cpuUsage / 100,
                      temp: '${widget.metrics.cpuTemp.toStringAsFixed(0)}°C',
                      color: dynamicCpuColor)),
              const SizedBox(width: 8),
              Expanded(
                  child: _CompactGauge(
                      title: AppStrings.tr('gpu_core'),
                      valuePct: widget.metrics.gpuUsage / 100,
                      temp: '${widget.metrics.gpuTemp.toStringAsFixed(0)}°C',
                      color: dynamicGpuColor)),
            ],
          ),
          const SizedBox(height: 8),
          _CompactBar(
              label: AppStrings.tr('ram_alloc'),
              pct: widget.metrics.ramPercent / 100,
              txt:
                  '${widget.metrics.ramUsed.toStringAsFixed(1)}/${widget.metrics.ramTotal.toStringAsFixed(0)}G',
              color: N.green),
          const SizedBox(height: 6),
          _CompactBar(
              label: AppStrings.tr('vram_alloc'),
              pct: widget.metrics.vramTotal > 0
                  ? (widget.metrics.vramUsed / widget.metrics.vramTotal)
                  : 0.0,
              txt: '${(widget.metrics.vramUsed / 1024).toStringAsFixed(1)}G',
              color: N.yellow),
          const SizedBox(height: 8),
          Align(
              alignment: AppStrings.currentLang == 'AR'
                  ? Alignment.centerRight
                  : Alignment.centerLeft,
              child: Text(AppStrings.tr('raw_telemetry'),
                  style: const TextStyle(
                      fontFamily: 'Orbitron',
                      fontSize: 9,
                      color: N.cyan,
                      letterSpacing: 1.5))),
          const SizedBox(height: 4),
          Expanded(
            child: GridView.count(
              crossAxisCount: 3,
              crossAxisSpacing: 6,
              mainAxisSpacing: 6,
              childAspectRatio: 1.8,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                _GridPill(
                    icon: '⚡',
                    label: AppStrings.tr('cpu_pwr'),
                    val: '${widget.metrics.cpuWatt.toStringAsFixed(0)}W',
                    color: dynamicCpuColor),
                _GridPill(
                    icon: '🔥',
                    label: AppStrings.tr('gpu_pwr'),
                    val: '${widget.metrics.gpuWatt.toStringAsFixed(0)}W',
                    color: dynamicGpuColor),
                _GridPill(
                    icon: '📊',
                    label: AppStrings.tr('cpu_clk'),
                    val: '${widget.metrics.cpuGhz.toStringAsFixed(1)}Ghz',
                    color: N.green),
                _GridPill(
                    icon: '💨',
                    label: AppStrings.tr('cpu_fan'),
                    val: '${widget.metrics.cpuFan.toStringAsFixed(0)} Rpm',
                    color: N.cyan),
                _GridPill(
                    icon: '🌀',
                    label: AppStrings.tr('gpu_fan'),
                    val: '${widget.metrics.gpuFan.toStringAsFixed(0)} Rpm',
                    color: N.orange),
                _GridPill(
                    icon: '🌡️',
                    label: AppStrings.tr('mobo'),
                    val: '${widget.metrics.moboTemp.toStringAsFixed(0)}°C',
                    color: N.purple),
                _GridPill(
                    icon: '💽',
                    label: AppStrings.tr('disk'),
                    val: '${widget.metrics.diskTemp.toStringAsFixed(0)}°C',
                    color: N.muted),
                _GridPill(
                    icon: '📡',
                    label: AppStrings.tr('net_ping'),
                    val: '${widget.metrics.ping.toStringAsFixed(0)}ms',
                    color: N.cyan),
                _GridPill(
                    icon: '⚙️',
                    label: AppStrings.tr('mode_suffix'),
                    val: _selectedMode,
                    color: N.yellow),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _CompactGauge extends StatelessWidget {
  final String title, temp;
  final double valuePct;
  final Color color;
  const _CompactGauge(
      {required this.title,
      required this.valuePct,
      required this.temp,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return HoloCard(
      glowColor: color,
      padding: 8,
      child: Column(
        children: [
          Text(title,
              style: TextStyle(
                  fontFamily: 'Orbitron',
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                  color: color)),
          const SizedBox(height: 6),
          CircularPercentIndicator(
            radius: 36,
            lineWidth: 6,
            percent: valuePct.clamp(0.0, 1.0),
            center: Text('${(valuePct * 100).toStringAsFixed(0)}%',
                style: TextStyle(
                    fontFamily: 'Rajdhani',
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: color)),
            circularStrokeCap: CircularStrokeCap.round,
            backgroundColor: Colors.white.withOpacity(0.02),
            progressColor: color,
          ),
          const SizedBox(height: 4),
          Text(temp,
              style: const TextStyle(
                  fontFamily: 'Rajdhani',
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: N.text)),
        ],
      ),
    );
  }
}

class _CompactBar extends StatelessWidget {
  final String label, txt;
  final double pct;
  final Color color;
  const _CompactBar(
      {required this.label,
      required this.pct,
      required this.txt,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return HoloCard(
      glowColor: color,
      padding: 8,
      child: Row(
        children: [
          Text(label,
              style: TextStyle(
                  fontFamily: 'Orbitron',
                  fontSize: 9,
                  fontWeight: FontWeight.bold,
                  color: color)),
          const SizedBox(width: 10),
          Expanded(
              child: LinearPercentIndicator(
                  lineHeight: 6,
                  percent: pct.clamp(0.0, 1.0),
                  backgroundColor: Colors.white.withOpacity(0.04),
                  progressColor: color,
                  barRadius: const Radius.circular(3),
                  padding: EdgeInsets.zero)),
          const SizedBox(width: 10),
          // اتجاه النص من اليسار لليمين باش الأرقام ما تنقلبش في العربية
          Directionality(
            textDirection: TextDirection.ltr,
            child: Text(txt,
                style: const TextStyle(
                    fontFamily: 'Rajdhani',
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: N.text)),
          ),
        ],
      ),
    );
  }
}

class _GridPill extends StatelessWidget {
  final String icon, label, val;
  final Color color;
  const _GridPill(
      {required this.icon,
      required this.label,
      required this.val,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return HoloCard(
      glowColor: color,
      padding: 6,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(icon, style: const TextStyle(fontSize: 12)),
              const SizedBox(width: 4),
              Text(label,
                  style: const TextStyle(
                      fontFamily: 'Orbitron',
                      fontSize: 8,
                      color: N.subtext,
                      fontWeight: FontWeight.bold)),
            ],
          ),
          const SizedBox(height: 2),
          Directionality(
            textDirection: TextDirection.ltr,
            child: Text(val,
                style: TextStyle(
                    fontFamily: 'Rajdhani',
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: color)),
          ),
        ],
      ),
    );
  }
}

// =============================================
// ==========  TASK MANAGER VIEW 2.0  ==========
// =============================================
class TaskManagerView extends StatefulWidget {
  final String apiUrl;
  const TaskManagerView({super.key, required this.apiUrl});
  @override
  State<TaskManagerView> createState() => _TaskManagerViewState();
}

class _TaskManagerViewState extends State<TaskManagerView> {
  String _sortBy = 'ram';
  bool _cleaned = false;
  List<dynamic> _rawProcesses = [];
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _fetchProcesses();
    _timer =
        Timer.periodic(const Duration(seconds: 2), (_) => _fetchProcesses());
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  Future<void> _fetchProcesses() async {
    try {
      final res = await http.get(Uri.parse('${widget.apiUrl}/processes'));
      if (res.statusCode == 200 && mounted) {
        setState(() => _rawProcesses = json.decode(res.body)['processes']);
      }
    } catch (_) {}
  }

  Future<void> _killGroup(List<int> pids) async {
    try {
      for (int pid in pids) {
        await http.post(Uri.parse('${widget.apiUrl}/kill'),
            headers: {'Content-Type': 'application/json'},
            body: json.encode({'pid': pid}));
      }
      HapticFeedback.lightImpact();
      _fetchProcesses();
    } catch (_) {}
  }

  Future<void> _bgClean() async {
    try {
      await http.post(Uri.parse('${widget.apiUrl}/bg_clean'));
      setState(() => _cleaned = true);
      HapticFeedback.mediumImpact();
      _fetchProcesses();
    } catch (_) {}
  }

  Widget _getProcessIcon(String name, Color color) {
    String low = name.toLowerCase();
    IconData icon = Icons.window;
    Color icoColor = color;
    if (low.contains('chrome')) {
      icon = Icons.web;
      icoColor = Colors.greenAccent;
    } else if (low.contains('discord')) {
      icon = Icons.discord;
      icoColor = const Color(0xFF5865F2);
    } else if (low.contains('steam')) {
      icon = Icons.sports_esports;
      icoColor = Colors.blueAccent;
    } else if (low.contains('spotify')) {
      icon = Icons.music_note;
      icoColor = const Color(0xFF1DB954);
    } else if (low.contains('code') || low.contains('visual')) {
      icon = Icons.terminal;
      icoColor = Colors.cyanAccent;
    }

    return Container(
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
          color: icoColor.withOpacity(0.1),
          shape: BoxShape.circle,
          border: Border.all(color: icoColor.withOpacity(0.3))),
      child: Icon(icon, color: icoColor, size: 18),
    );
  }

  @override
  Widget build(BuildContext context) {
    Map<String, Map<String, dynamic>> groupedProcs = {};
    for (var p in _rawProcesses) {
      String name = p['name'] ?? 'Unknown';
      if (!groupedProcs.containsKey(name)) {
        groupedProcs[name] = {
          'name': name,
          'ram_gb': 0.0,
          'cpu': 0.0,
          'count': 0,
          'pids': <int>[]
        };
      }
      groupedProcs[name]!['ram_gb'] += p['ram_gb'] ?? 0.0;
      groupedProcs[name]!['cpu'] += p['cpu'] ?? 0.0;
      groupedProcs[name]!['count'] += 1;
      groupedProcs[name]!['pids'].add(p['pid']);
    }

    final sorted = groupedProcs.values.toList();
    sorted.sort((a, b) => _sortBy == 'ram'
        ? (b['ram_gb']).compareTo(a['ram_gb'])
        : (b['cpu']).compareTo(a['cpu']));

    return SingleChildScrollView(
      padding: const EdgeInsets.all(12),
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          HoloCard(
            glowColor: N.purple,
            padding: 8,
            child: Row(
              children: [
                _sortBtn('RAM', 'ram', N.purple),
                const SizedBox(width: 6),
                _sortBtn('CPU', 'cpu', N.cyan),
                const Spacer(),
                _actionBtn(AppStrings.tr('hyper_clean'), N.orange, _bgClean),
              ],
            ),
          ),
          const SizedBox(height: 10),
          if (_cleaned)
            Container(
              margin: const EdgeInsets.only(bottom: 8),
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                  color: N.green.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: N.green)),
              child: Row(children: [
                const Icon(Icons.check_circle_outline,
                    color: N.green, size: 16),
                const SizedBox(width: 6),
                Text(AppStrings.tr('bg_clean_complete'),
                    style: const TextStyle(
                        fontFamily: 'Orbitron', fontSize: 11, color: N.green))
              ]),
            ),
          ...sorted.map((p) => Padding(
                padding: const EdgeInsets.only(bottom: 6.0),
                child: HoloCard(
                  glowColor: _sortBy == 'ram' ? N.purple : N.cyan,
                  padding: 10,
                  child: Row(
                    children: [
                      _getProcessIcon(
                          p['name'], _sortBy == 'ram' ? N.purple : N.cyan),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    p['name'],
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                    style: const TextStyle(
                                        fontFamily: 'Rajdhani',
                                        fontSize: 15,
                                        fontWeight: FontWeight.w700,
                                        color: N.text),
                                  ),
                                ),
                                const SizedBox(width: 4),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 4, vertical: 1),
                                  decoration: BoxDecoration(
                                      color: N.border,
                                      borderRadius: BorderRadius.circular(4)),
                                  child: Text('x${p['count']}',
                                      style: const TextStyle(
                                          fontFamily: 'Orbitron',
                                          fontSize: 8,
                                          color: N.subtext)),
                                )
                              ],
                            ),
                            const SizedBox(height: 2),
                            Directionality(
                              textDirection: TextDirection.ltr,
                              child: Row(
                                children: [
                                  Text(
                                      'RAM: ${p['ram_gb'].toStringAsFixed(2)} GB',
                                      style: const TextStyle(
                                          fontFamily: 'Rajdhani',
                                          fontSize: 11,
                                          color: N.purple,
                                          fontWeight: FontWeight.bold)),
                                  const Text(' | ',
                                      style: TextStyle(
                                          color: N.border, fontSize: 10)),
                                  Text('CPU: ${p['cpu'].toStringAsFixed(1)}%',
                                      style: const TextStyle(
                                          fontFamily: 'Rajdhani',
                                          fontSize: 11,
                                          color: N.cyan,
                                          fontWeight: FontWeight.bold)),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 10),
                      GestureDetector(
                        onTap: () => _killGroup(p['pids']),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 6),
                          decoration: BoxDecoration(
                              color: N.red.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(6),
                              border:
                                  Border.all(color: N.red.withOpacity(0.4))),
                          child: Text(AppStrings.tr('kill_all'),
                              style: const TextStyle(
                                  fontFamily: 'Orbitron',
                                  fontSize: 9,
                                  fontWeight: FontWeight.bold,
                                  color: N.red)),
                        ),
                      ),
                    ],
                  ),
                ),
              )),
        ],
      ),
    );
  }

  Widget _sortBtn(String label, String key, Color color) {
    final active = _sortBy == key;
    return GestureDetector(
      onTap: () => setState(() => _sortBy = key),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
            color: active ? color.withOpacity(0.15) : Colors.transparent,
            borderRadius: BorderRadius.circular(6),
            border: Border.all(color: active ? color : N.border)),
        child: Text(label,
            style: TextStyle(
                fontFamily: 'Orbitron',
                fontSize: 10,
                fontWeight: FontWeight.bold,
                color: active ? color : N.muted)),
      ),
    );
  }

  Widget _actionBtn(String label, Color color, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
            color: color.withOpacity(0.15),
            borderRadius: BorderRadius.circular(6),
            border: Border.all(color: color)),
        child: Text(label,
            style: TextStyle(
                fontFamily: 'Orbitron',
                fontSize: 10,
                fontWeight: FontWeight.bold,
                color: color)),
      ),
    );
  }
}

// =============================================
// =========  SMART ALERTS VIEW  =============
// =============================================
class SmartAlertsView extends StatefulWidget {
  final SystemMetrics metrics;
  const SmartAlertsView({super.key, required this.metrics});
  @override
  State<SmartAlertsView> createState() => _SmartAlertsViewState();
}

class _SmartAlertsViewState extends State<SmartAlertsView> {
  final Map<String, bool> _enabled = {
    'cpu_temp': true,
    'gpu_temp': true,
    'ping': true,
    'fps': true
  };
  final Map<String, double> _thresholds = {
    'cpu_temp': 85,
    'gpu_temp': 88,
    'ping': 50,
    'fps': 60
  };

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(14),
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          HoloCard(
            glowColor: N.yellow,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(AppStrings.tr('security_thresh'),
                    style: const TextStyle(
                        fontFamily: 'Orbitron',
                        fontSize: 10,
                        color: N.yellow,
                        letterSpacing: 1.5)),
                const SizedBox(height: 14),
                _buildSliderRow('cpu_temp', AppStrings.tr('cpu_temp_limit'),
                    '°C', 60.0, 100.0, N.cyan),
                _buildSliderRow('gpu_temp', AppStrings.tr('gpu_temp_limit'),
                    '°C', 60.0, 100.0, N.orange),
                _buildSliderRow('ping', AppStrings.tr('max_ping_limit'), 'ms',
                    10.0, 200.0, N.green),
                _buildSliderRow('fps', AppStrings.tr('min_fps_limit'), 'fps',
                    30.0, 144.0, N.purple),
              ],
            ),
          ),
          const SizedBox(height: 12),
          HoloCard(
            glowColor: N.subtext,
            child: SizedBox(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(AppStrings.tr('system_logs'),
                      style: const TextStyle(
                          fontFamily: 'Orbitron',
                          fontSize: 10,
                          color: N.subtext,
                          letterSpacing: 1.5)),
                  const SizedBox(height: 10),
                  Text(
                      widget.metrics.cpuTemp > 85
                          ? AppStrings.tr('warning_thermal')
                          : AppStrings.tr('system_clean_logs'),
                      style: TextStyle(
                          fontFamily: 'Rajdhani',
                          fontSize: 13,
                          color:
                              widget.metrics.cpuTemp > 85 ? N.red : N.green)),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildSliderRow(String key, String label, String unit, double min,
      double max, Color color) {
    final enabled = _enabled[key]!;
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Column(
        children: [
          Row(
            children: [
              GestureDetector(
                onTap: () => setState(() => _enabled[key] = !enabled),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 250),
                  width: 32,
                  height: 18,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(9),
                      color: enabled ? color : N.border),
                  child: AnimatedAlign(
                    duration: const Duration(milliseconds: 250),
                    alignment:
                        enabled ? Alignment.centerRight : Alignment.centerLeft,
                    child: Container(
                        margin: const EdgeInsets.all(2),
                        width: 14,
                        height: 14,
                        decoration: const BoxDecoration(
                            color: Colors.white, shape: BoxShape.circle)),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                  child: Text(label,
                      style: TextStyle(
                          fontFamily: 'Rajdhani',
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: enabled ? color : N.muted))),
              Directionality(
                textDirection: TextDirection.ltr,
                child: Text('${_thresholds[key]!.toStringAsFixed(0)}$unit',
                    style: TextStyle(
                        fontFamily: 'Orbitron',
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: color)),
              ),
            ],
          ),
          SliderTheme(
            data: SliderTheme.of(context).copyWith(
                trackHeight: 1.5,
                thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 5)),
            child: Slider(
                value: _thresholds[key]!,
                min: min,
                max: max,
                activeColor: enabled ? color : N.border,
                inactiveColor: N.border.withOpacity(0.3),
                onChanged: enabled
                    ? (v) => setState(() => _thresholds[key] = v)
                    : null),
          ),
        ],
      ),
    );
  }
}

// Placeholder for Optimizer View
class GameOptimizerView extends StatelessWidget {
  const GameOptimizerView({super.key});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: HoloCard(
        glowColor: N.green,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.smart_toy, color: N.green, size: 44),
            const SizedBox(height: 12),
            Text(AppStrings.tr('neural_offline'),
                style: const TextStyle(
                    fontFamily: 'Orbitron',
                    fontSize: 14,
                    color: N.green,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2)),
            const SizedBox(height: 6),
            Text(AppStrings.tr('ai_requires_token'),
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontFamily: 'Rajdhani', fontSize: 13, color: N.subtext)),
          ],
        ),
      ),
    );
  }
}
