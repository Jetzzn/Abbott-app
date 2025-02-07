import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'zh_Hans', 'ja'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? zh_HansText = '',
    String? jaText = '',
  }) =>
      [enText, zh_HansText, jaText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

/// Used if the locale is not supported by GlobalMaterialLocalizations.
class FallbackMaterialLocalizationDelegate
    extends LocalizationsDelegate<MaterialLocalizations> {
  const FallbackMaterialLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<MaterialLocalizations> load(Locale locale) async =>
      SynchronousFuture<MaterialLocalizations>(
        const DefaultMaterialLocalizations(),
      );

  @override
  bool shouldReload(FallbackMaterialLocalizationDelegate old) => false;
}

/// Used if the locale is not supported by GlobalCupertinoLocalizations.
class FallbackCupertinoLocalizationDelegate
    extends LocalizationsDelegate<CupertinoLocalizations> {
  const FallbackCupertinoLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<CupertinoLocalizations> load(Locale locale) =>
      SynchronousFuture<CupertinoLocalizations>(
        const DefaultCupertinoLocalizations(),
      );

  @override
  bool shouldReload(FallbackCupertinoLocalizationDelegate old) => false;
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

bool _isSupportedLocale(Locale locale) {
  final language = locale.toString();
  return FFLocalizations.languages().contains(
    language.endsWith('_')
        ? language.substring(0, language.length - 1)
        : language,
  );
}

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // login
  {
    'l3ypzr50': {
      'en': 'Welcome',
      'ja': 'いらっしゃいませ',
      'zh_Hans': '欢迎',
    },
    'iubkoy6t': {
      'en': 'Let\'s get started by filling out the form below.',
      'ja': 'まずは以下のフォームに記入しましょう。',
      'zh_Hans': '让我们从填写下面的表格开始。',
    },
    'l9owux4y': {
      'en': 'Email',
      'ja': 'メール',
      'zh_Hans': '电子邮件',
    },
    'w4acyb5t': {
      'en': 'Password',
      'ja': 'パスワード',
      'zh_Hans': '密码',
    },
    'hk9l8y8x': {
      'en': 'Sign In',
      'ja': 'サインイン',
      'zh_Hans': '登入',
    },
    'mwk0q6s4': {
      'en': 'Allow  Notifications',
      'ja': '',
      'zh_Hans': '',
    },
    'dgntiroe': {
      'en': 'Home',
      'ja': '家',
      'zh_Hans': '家',
    },
  },
  // Home
  {
    'wztbc789': {
      'en': 'Home',
      'ja': '家',
      'zh_Hans': '家',
    },
    'bj1gcq6k': {
      'en': 'Event Agenda',
      'ja': 'イベントアジェンダ',
      'zh_Hans': '活动议程',
    },
    '9ax8zabd': {
      'en': 'Floor Plan',
      'ja': 'フロアプラン',
      'zh_Hans': '楼层平面图',
    },
    'b29gj5xo': {
      'en': 'Speakers Schedule',
      'ja': '講演スケジュール',
      'zh_Hans': '演讲者日程',
    },
    '63busscq': {
      'en': 'FAQ',
      'ja': 'よくある質問',
      'zh_Hans': '常问问题',
    },
    '1w638nkk': {
      'en': 'Feedback',
      'ja': 'フィードバック',
      'zh_Hans': '反馈',
    },
    '4zrykk7x': {
      'en': 'Settings',
      'ja': '設定',
      'zh_Hans': '设置',
    },
    'o5v1ia1x': {
      'en': 'Language options:',
      'ja': '言語オプション:',
      'zh_Hans': '语言选项:',
    },
    '035ooaf5': {
      'en': 'Your QR Code',
      'ja': 'QRコード',
      'zh_Hans': '您的二维码',
    },
    'i6w0lpix': {
      'en': 'Agenda',
      'ja': '議題',
      'zh_Hans': '议程',
    },
    'eukx95u5': {
      'en': 'Floor Plan',
      'ja': 'フロアプラン',
      'zh_Hans': '楼层平面图',
    },
    'onh5f95r': {
      'en': 'Speaker',
      'ja': 'スピーカー',
      'zh_Hans': '扬声器',
    },
    'y8c2v5uo': {
      'en': 'Team Profile',
      'ja': 'チームプロフィール',
      'zh_Hans': '团队简介',
    },
    'w0hyvyc8': {
      'en': 'Event Gallery',
      'ja': 'イベントギャラリー',
      'zh_Hans': '活动图库',
    },
    'z45we47a': {
      'en': 'FAQ',
      'ja': 'よくある質問',
      'zh_Hans': '常问问题',
    },
    'g56hvdk4': {
      'en': 'Feed Back',
      'ja': 'フィードバック',
      'zh_Hans': '反馈',
    },
    'yqqamymr': {
      'en': 'Digital Handbook',
      'ja': 'デジタルハンドブック',
      'zh_Hans': '数字手册',
    },
    'qduicz2a': {
      'en': 'Home',
      'ja': '家',
      'zh_Hans': '家',
    },
  },
  // DayilyEventAgenda
  {
    'cosye2dp': {
      'en': 'OVERALL',
      'ja': '全体',
      'zh_Hans': '全面的',
    },
    'j42tnayk': {
      'en': 'OVERALL AGENDA',
      'ja': '全体議題',
      'zh_Hans': '总体议程',
    },
    'm46n8oqt': {
      'en': 'SAT 15 FEB',
      'ja': '2月15日（土）',
      'zh_Hans': '2 月 15 日，星期六',
    },
    'hayeae5h': {
      'en': ' Royal Orchid Ballroom, Level 2',
      'ja': 'ロイヤルオーキッドボールルーム、2階',
      'zh_Hans': '皇家兰花宴会厅，2 楼',
    },
    'gy81g2zg': {
      'en': 'Dress code:  Abbott Polo T-shirt',
      'ja': 'ドレスコード: アボットポロTシャツ',
      'zh_Hans': '着装要求：Abbott Polo T 恤',
    },
    'xsirrmk4': {
      'en': '08:00 - 12:00 ',
      'ja': '',
      'zh_Hans': '',
    },
    'uho48hd2': {
      'en': 'Business Presentations',
      'ja': '',
      'zh_Hans': '',
    },
    'en0i0p8e': {
      'en': '12:00 - 13:00',
      'ja': '',
      'zh_Hans': '',
    },
    '6l2ixr2z': {
      'en': 'Buffet Lunch',
      'ja': '',
      'zh_Hans': '',
    },
    '8vq94pay': {
      'en': 'Feast, Giorgio’s, \nSiam Yacht @ Level 1',
      'ja': '',
      'zh_Hans': '',
    },
    'ckncs8ol': {
      'en': '13:00 - 16:30',
      'ja': '',
      'zh_Hans': '',
    },
    'hawh0trk': {
      'en': 'Business \nPresentations - continue',
      'ja': '',
      'zh_Hans': '',
    },
    'z68cvwe2': {
      'en': '16:30 - 17:00',
      'ja': '',
      'zh_Hans': '',
    },
    'vvvpvy16': {
      'en': 'Leadership Q&A Panel',
      'ja': '',
      'zh_Hans': '',
    },
    '7ajjm1bl': {
      'en': '17:00 - 17:30',
      'ja': '',
      'zh_Hans': '',
    },
    'w6ndmxwo': {
      'en': 'Group Photo',
      'ja': '',
      'zh_Hans': '',
    },
    'p6s14qu0': {
      'en': '18:00 - 20:30',
      'ja': '',
      'zh_Hans': '',
    },
    '6n0x9ggj': {
      'en': 'Dinner on Cruise ',
      'ja': '',
      'zh_Hans': '',
    },
    '0q07k2gp': {
      'en': 'Chao Phraya River',
      'ja': '',
      'zh_Hans': '',
    },
    'gssnatjj': {
      'en': 'SUN 16 FEB',
      'ja': '2月16日（日）',
      'zh_Hans': '2 月 16 日，周日',
    },
    '0cyc1dn4': {
      'en': 'Dress code:  Business Casual',
      'ja': 'ドレスコード: ビジネスカジュアル',
      'zh_Hans': '着装要求：商务休闲',
    },
    'vnyq60ns': {
      'en': '08:30 - 16:30',
      'ja': '',
      'zh_Hans': '',
    },
    'zv79baij': {
      'en':
          'Countries Breakout \nSessions \n(exact time, determine \nby countries)',
      'ja': '',
      'zh_Hans': '',
    },
    '0ru6a5a1': {
      'en': '- Greater China',
      'ja': '',
      'zh_Hans': '',
    },
    'crmrb99k': {
      'en': 'Ballroom 2 & 3, Level 2',
      'ja': '',
      'zh_Hans': '',
    },
    'yvk4rydx': {
      'en': '- Japan',
      'ja': '',
      'zh_Hans': '',
    },
    'm2kalj0h': {
      'en': 'Ballroom 1, Level 2',
      'ja': '',
      'zh_Hans': '',
    },
    '6hp83htl': {
      'en': '- EMAK',
      'ja': '',
      'zh_Hans': '',
    },
    'qxc4wdh7': {
      'en': 'Riverside 4, 5-7, Level 2',
      'ja': '',
      'zh_Hans': '',
    },
    '5pkrqht6': {
      'en': '- ANZ',
      'ja': '',
      'zh_Hans': '',
    },
    '4f6qb4dl': {
      'en': 'Pompadour, Level 2',
      'ja': '',
      'zh_Hans': '',
    },
    'd0kofy00': {
      'en': '- ANZ',
      'ja': '',
      'zh_Hans': '',
    },
    'pffe189r': {
      'en': 'Panisea 1, Level 1',
      'ja': '',
      'zh_Hans': '',
    },
    'ensdhwry': {
      'en': '- ANZ',
      'ja': '',
      'zh_Hans': '',
    },
    'e8zect6f': {
      'en': 'Panisea 2, Level 1',
      'ja': '',
      'zh_Hans': '',
    },
    'zquvqn2u': {
      'en': '- APAC Finance',
      'ja': '',
      'zh_Hans': '',
    },
    'iyvazh33': {
      'en': 'Riverside 1 & 2, Level 2',
      'ja': '',
      'zh_Hans': '',
    },
    'b0oqnom3': {
      'en': '- APAC Marketing',
      'ja': '',
      'zh_Hans': '',
    },
    'ng05s0u2': {
      'en': 'Riverside 3',
      'ja': '',
      'zh_Hans': '',
    },
    '3ama3avw': {
      'en': '10:00 - 10:15',
      'ja': '',
      'zh_Hans': '',
    },
    'urz5cfoo': {
      'en': 'AM Coffee break',
      'ja': '',
      'zh_Hans': '',
    },
    '0vj5z75n': {
      'en': '12:00 - 13:00',
      'ja': '',
      'zh_Hans': '',
    },
    'fega8sim': {
      'en': 'Buffet Lunch - timing \nbased on country \nschedules',
      'ja': '',
      'zh_Hans': '',
    },
    'e4xm5l4w': {
      'en': 'Feast,Giorgio’s, \nSiam Yacht @ Level 1',
      'ja': '',
      'zh_Hans': '',
    },
    '36iy2p66': {
      'en': '13:00 - 16:30',
      'ja': '',
      'zh_Hans': '',
    },
    'd4gejg6l': {
      'en': 'Countries Breakout \nSessions  - Continues',
      'ja': '',
      'zh_Hans': '',
    },
    '1fyvtgqz': {
      'en': '16:30 - 17:00',
      'ja': '',
      'zh_Hans': '',
    },
    'rymf5907': {
      'en': 'Wrap up',
      'ja': '',
      'zh_Hans': '',
    },
    'yndrqmma': {
      'en': 'Gala Awards Night',
      'ja': '',
      'zh_Hans': '',
    },
    '9856sy6s': {
      'en': 'Dress code: \nFormal and/or Traditional Ethnic Outfit',
      'ja': '',
      'zh_Hans': '',
    },
    'pzk0srq0': {
      'en': '18:30 - 19:00',
      'ja': '',
      'zh_Hans': '',
    },
    'ekuclst8': {
      'en': 'Cocktail reception in\n Foyer',
      'ja': '',
      'zh_Hans': '',
    },
    'vnfiemfa': {
      'en': '19:00 - 23:00',
      'ja': '',
      'zh_Hans': '',
    },
    'bz74jpg8': {
      'en': 'Gala Dinner Night ',
      'ja': '',
      'zh_Hans': '',
    },
    'taqpq5ck': {
      'en': 'Royal Orchid Ballroom\n@ Level 2',
      'ja': '',
      'zh_Hans': '',
    },
    'thugoloj': {
      'en': 'MON 17 FEB',
      'ja': '2月17日（月）',
      'zh_Hans': '2 月 17 日星期一',
    },
    'oqpoe3qi': {
      'en': 'Dress code: Comfortable Outdoor Attire',
      'ja': '服装規定: 快適なアウトドアウェア',
      'zh_Hans': '着装要求：舒适的户外服装',
    },
    'bk5tf5o4': {
      'en': '08:00 - 12:00 ',
      'ja': '',
      'zh_Hans': '',
    },
    '6jrqyvaz': {
      'en': 'Activity \n(individual pre-selected)',
      'ja': '',
      'zh_Hans': '',
    },
    'jm43zjh2': {
      'en': '- 3 to 4 hours of each activity',
      'ja': '',
      'zh_Hans': '',
    },
    'pj8kpeea': {
      'en': '- Lunch is excluded',
      'ja': '',
      'zh_Hans': '',
    },
    'qklnqem2': {
      'en': '- Assemble in lobby and \nfollow event crew instructions',
      'ja': '',
      'zh_Hans': '',
    },
    '9aa4mwhj': {
      'en': '17:00 onwards',
      'ja': '',
      'zh_Hans': '',
    },
    'xw144zfa': {
      'en': 'Departures',
      'ja': '',
      'zh_Hans': '',
    },
    'kwqnlyty': {
      'en': 'Home',
      'ja': '家',
      'zh_Hans': '家',
    },
    '283yz3d6': {
      'en': 'Event Agenda',
      'ja': 'イベントアジェンダ',
      'zh_Hans': '活动议程',
    },
    'mgrzsu4e': {
      'en': 'Floor Plan',
      'ja': 'フロアプラン',
      'zh_Hans': '楼层平面图',
    },
    '4oxxlgta': {
      'en': 'Speakers Schedule',
      'ja': '講演スケジュール',
      'zh_Hans': '演讲者日程',
    },
    'orycdow0': {
      'en': 'FAQ',
      'ja': 'よくある質問',
      'zh_Hans': '常问问题',
    },
    '85af9xbt': {
      'en': 'Feedback',
      'ja': 'フィードバック',
      'zh_Hans': '反馈',
    },
    'b0lvhosg': {
      'en': 'Settings',
      'ja': '設定',
      'zh_Hans': '设置',
    },
    'yulisnou': {
      'en': 'Language options:',
      'ja': '言語オプション:',
      'zh_Hans': '语言选项:',
    },
    '8pe1qo0f': {
      'en': 'Agenda',
      'ja': '家',
      'zh_Hans': '家',
    },
  },
  // FAQ
  {
    '1390p1mh': {
      'en': 'FAQ',
      'ja': 'よくある質問',
      'zh_Hans': '常问问题',
    },
    'hlzbau0c': {
      'en': 'Event Information',
      'ja': 'イベント情報',
      'zh_Hans': '活动信息',
    },
    'n1b2ca6f': {
      'en': 'Registration & Participation',
      'ja': '登録と参加',
      'zh_Hans': '报名及参与',
    },
    '2irsoody': {
      'en': 'Agenda & Program',
      'ja': '議題とプログラム',
      'zh_Hans': '议程及计划',
    },
    'ouzn886e': {
      'en': 'Health & Safety',
      'ja': '健康と安全',
      'zh_Hans': '健康与安全',
    },
    'bdmrkqfd': {
      'en': 'Airport Map',
      'ja': '健康と安全',
      'zh_Hans': '健康与安全',
    },
    'n814pv51': {
      'en': 'Home',
      'ja': '家',
      'zh_Hans': '家',
    },
    'onr0i0ie': {
      'en': 'Event Agenda',
      'ja': 'イベントアジェンダ',
      'zh_Hans': '活动议程',
    },
    '56qlfex3': {
      'en': 'Floor Plan',
      'ja': 'フロアプラン',
      'zh_Hans': '楼层平面图',
    },
    '86x6y1r7': {
      'en': 'Speakers Schedule',
      'ja': '講演スケジュール',
      'zh_Hans': '演讲者日程',
    },
    'bz6f5yfh': {
      'en': 'FAQ',
      'ja': 'よくある質問',
      'zh_Hans': '常问问题',
    },
    'xgtn08wm': {
      'en': 'Feedback',
      'ja': 'フィードバック',
      'zh_Hans': '反馈',
    },
    'rwxlfx96': {
      'en': 'Settings',
      'ja': '設定',
      'zh_Hans': '设置',
    },
    '7w17gsp1': {
      'en': 'Language options:',
      'ja': '言語オプション:',
      'zh_Hans': '语言选项:',
    },
    'j3i4x8uh': {
      'en': 'Home',
      'ja': '家',
      'zh_Hans': '家',
    },
  },
  // FAQEventInfo
  {
    's2lbrq7n': {
      'en': 'Event Information',
      'ja': 'イベント情報',
      'zh_Hans': '活动信息',
    },
    'lg28p3gg': {
      'en': 'How do I get to Orchird Sheraton Building?',
      'ja': 'オーチャード シェラトン ビルへはどうやって行けばいいですか?',
      'zh_Hans': '如何前往乌节喜来登大厦？',
    },
    '5r9yqous': {
      'en':
          '1. You are highly encouraged to use Grab or authorised transport channels.',
      'ja': '1. Grab または認可された交通手段のご利用を強くお勧めします。',
      'zh_Hans': '1. 强烈建议您使用 Grab 或授权的交通渠道。',
    },
    '9z999rmq': {
      'en':
          '2. Nearest Station: BTS Skytrain, Krung Thep Maha Nakhon, 1.5km away from Orchird Sheraton Building.',
      'ja': '2. 最寄り駅：BTSスカイトレイン、クルンテープ・マハナコン駅、オーチャード・シェラトン・ビルから1.5km。',
      'zh_Hans':
          '2. 最近的车站：BTS Skytrain，Krung Thep Maha Nakhon，距离乌节喜来登大厦 1.5 公里。',
    },
    'yz5qbpo6': {
      'en':
          '3. \nFrom Krung Thep Maha Nakhon Station, you can take the ferry at Sapan Taksin. Click on this link to get the step-by-step procedure. ',
      'ja':
          '3.\nクルンテープ・マハナコン駅からは、サパンタクシンでフェリーに乗ることができます。手順を順を追って説明するには、このリンクをクリックしてください。',
      'zh_Hans':
          '3. \n从 Krung Thep Maha Nakhon 站出发，您可以在 Sapan Taksin 乘坐渡轮。点击此链接获取分步流程。',
    },
    '8ovp0gfx': {
      'en': 'What is the date and time of the Kick-Off Meeting?',
      'ja': 'キックオフミーティングの日時は何ですか?',
      'zh_Hans': '启动会议的日期和时间是什么？',
    },
    'ux3npesf': {
      'en':
          'The event will take place on [Date], starting at [Time]. Please make sure to arrive 15-30 minutes early for check-in.',
      'ja': 'イベントは [日付] の [時刻] に開催されます。チェックインのために 15 ～ 30 分前に到着するようにしてください。',
      'zh_Hans': '活动将于 [日期] 举行，开始时间为 [时间]。请务必提前 15-30 分钟到达并签到。',
    },
    'n7yikeny': {
      'en': 'Where is the event taking place?',
      'ja': 'イベントはどこで開催されますか?',
      'zh_Hans': '活动在哪里举行？',
    },
    '3ea8ijoo': {
      'en':
          'The meeting will be held at [Venue Name, Address]. You can find directions and parking information on the [Venue Page] within the app.',
      'ja': '会議は[会場名、住所]で開催されます。道順や駐車場の情報はアプリ内の[会場ページ]でご確認いただけます。',
      'zh_Hans': '会议将在[场地名称，地址]举行。您可以在应用程序内的[场地页面]上找到路线和停车信息。',
    },
    'hsmpb66l': {
      'en': 'Is there parking available at the venue?',
      'ja': '会場に駐車場はありますか？',
      'zh_Hans': '会场有停车位吗？',
    },
    '1ddakn9v': {
      'en':
          'Yes, [Number] of parking spots are available at the venue. Additional parking can be found at [Location]. Please follow the signs when you arrive.',
      'ja': 'はい、会場には [台数] の駐車スペースがあります。追加の駐車場は [場所] にあります。到着したら標識に従ってください。',
      'zh_Hans': '是的，会场有 [Number] 个停车位。[Location] 处有其他停车位。抵达后请按照指示牌行驶。',
    },
    'hc6dql7a': {
      'en': 'What is the dress code of the event?',
      'ja': 'イベントのドレスコードは何ですか？',
      'zh_Hans': '此次活动的着装要求是什么？',
    },
    '3mf6eseg': {
      'en': 'Business casual attire is recommended.',
      'ja': 'ビジネスカジュアルな服装が推奨されます。',
      'zh_Hans': '建议穿商务休闲装。',
    },
    'k3ojpzxq': {
      'en': 'Home',
      'ja': '家',
      'zh_Hans': '家',
    },
  },
  // FloorPlan
  {
    '9u2m9wea': {
      'en': 'Home',
      'ja': '家',
      'zh_Hans': '家',
    },
    'wj0z9lhp': {
      'en': 'Event Agenda',
      'ja': 'イベントアジェンダ',
      'zh_Hans': '活动议程',
    },
    'p9za3gk3': {
      'en': 'Floor Plan',
      'ja': 'フロアプラン',
      'zh_Hans': '楼层平面图',
    },
    '1jcuncgb': {
      'en': 'Speakers Schedule',
      'ja': '講演スケジュール',
      'zh_Hans': '演讲者日程',
    },
    'ea1w2veg': {
      'en': 'FAQ',
      'ja': 'よくある質問',
      'zh_Hans': '常问问题',
    },
    'rd8lldof': {
      'en': 'Feedback',
      'ja': 'フィードバック',
      'zh_Hans': '反馈',
    },
    '37el8ott': {
      'en': 'Settings',
      'ja': '設定',
      'zh_Hans': '设置',
    },
    '8pphwhvl': {
      'en': 'Language options:',
      'ja': '言語オプション:',
      'zh_Hans': '语言选项:',
    },
    's3nya8kb': {
      'en': 'OVERALL FLOORPLAN',
      'ja': '全体のフロアプラン',
      'zh_Hans': '总体平面图',
    },
    'ifxdak17': {
      'en': 'Floorplan',
      'ja': '家',
      'zh_Hans': '家',
    },
  },
  // Profile15
  {
    '0dpjxojn': {
      'en': 'Edit Profile',
      'ja': 'プロフィールを編集',
      'zh_Hans': '編輯資料',
    },
    'b6daqw7c': {
      'en': 'Change Password',
      'ja': 'パスワードを変更する',
      'zh_Hans': '更改密码',
    },
    'gcp0gv8e': {
      'en': 'Notification Settings',
      'ja': '通知設定',
      'zh_Hans': '通知设置',
    },
    'oeoewcd5': {
      'en': 'Terms of Services',
      'ja': '利用規約',
      'zh_Hans': '服务条款',
    },
    'imjiyvvj': {
      'en': 'Log Out',
      'ja': 'ログアウト',
      'zh_Hans': '登出',
    },
  },
  // FAQRegis
  {
    'vrw7mqgp': {
      'en': 'Registration & Participation',
      'ja': '登録と参加',
      'zh_Hans': '报名及参与',
    },
    'zoj0agvj': {
      'en': 'How do I get to Orchird Sheraton Building?',
      'ja': 'オーチャード シェラトン ビルへはどうやって行けばいいですか?',
      'zh_Hans': '如何前往乌节喜来登大厦？',
    },
    'lz9ilrdy': {
      'en':
          '1. You are highly encouraged to use Grab or authorised transport channels.',
      'ja': '1. Grab または認可された交通手段のご利用を強くお勧めします。',
      'zh_Hans': '1. 强烈建议您使用 Grab 或授权的交通渠道。',
    },
    'ivej8stk': {
      'en':
          '2. Nearest Station: BTS Skytrain, Krung Thep Maha Nakhon, 1.5km away from Orchird Sheraton Building.',
      'ja': '2. 最寄り駅：BTSスカイトレイン、クルンテープ・マハナコン駅、オーチャード・シェラトン・ビルから1.5km。',
      'zh_Hans':
          '2. 最近的车站：BTS Skytrain，Krung Thep Maha Nakhon，距离乌节喜来登大厦 1.5 公里。',
    },
    'xlr10nzd': {
      'en':
          '3. \nFrom Krung Thep Maha Nakhon Station, you can take the ferry at Sapan Taksin. Click on this link to get the step-by-step procedure. ',
      'ja':
          '3.\nクルンテープ・マハナコン駅からは、サパンタクシンでフェリーに乗ることができます。手順を順を追って説明するには、このリンクをクリックしてください。',
      'zh_Hans':
          '3. \n从 Krung Thep Maha Nakhon 站出发，您可以在 Sapan Taksin 乘坐渡轮。点击此链接获取分步流程。',
    },
    'p03ej4q3': {
      'en': 'What is the date and time of the Kick-Off Meeting?',
      'ja': 'キックオフミーティングの日時は何ですか?',
      'zh_Hans': '启动会议的日期和时间是什么？',
    },
    '2vsalyt3': {
      'en':
          'The event will take place on [Date], starting at [Time]. Please make sure to arrive 15-30 minutes early for check-in.',
      'ja': 'イベントは [日付] の [時刻] に開催されます。チェックインのために 15 ～ 30 分前に到着するようにしてください。',
      'zh_Hans': '活动将于 [日期] 举行，开始时间为 [时间]。请务必提前 15-30 分钟到达并签到。',
    },
    '967cf4n7': {
      'en': 'Where is the event taking place?',
      'ja': 'イベントはどこで開催されますか?',
      'zh_Hans': '活动在哪里举行？',
    },
    'rpmfh4fk': {
      'en':
          'The meeting will be held at [Venue Name, Address]. You can find directions and parking information on the [Venue Page] within the app.',
      'ja': '会議は[会場名、住所]で開催されます。道順や駐車場の情報はアプリ内の[会場ページ]でご確認いただけます。',
      'zh_Hans': '会议将在[场地名称，地址]举行。您可以在应用程序内的[场地页面]上找到路线和停车信息。',
    },
    'fmok2dtj': {
      'en': 'Is there parking available at the venue?',
      'ja': '会場に駐車場はありますか？',
      'zh_Hans': '会场有停车位吗？',
    },
    'j0y072ln': {
      'en':
          'Yes, [Number] of parking spots are available at the venue. Additional parking can be found at [Location]. Please follow the signs when you arrive.',
      'ja': 'はい、会場には [台数] の駐車スペースがあります。追加の駐車場は [場所] にあります。到着したら標識に従ってください。',
      'zh_Hans': '是的，会场有 [Number] 个停车位。[Location] 处有其他停车位。抵达后请按照指示牌行驶。',
    },
    'cv7x26io': {
      'en': 'What is the dress code of the event?',
      'ja': 'イベントのドレスコードは何ですか？',
      'zh_Hans': '此次活动的着装要求是什么？',
    },
    'n8nuul9v': {
      'en': 'Business casual attire is recommended.',
      'ja': 'ビジネスカジュアルな服装が推奨されます。',
      'zh_Hans': '建议穿商务休闲装。',
    },
    'oktt9rbx': {
      'en': 'Home',
      'ja': '家',
      'zh_Hans': '家',
    },
  },
  // FAQAgenda
  {
    'gbxd9prs': {
      'en': 'Agenda & Program',
      'ja': '議題とプログラム',
      'zh_Hans': '议程及计划',
    },
    '35rdkc1j': {
      'en': 'How do I get to Orchird Sheraton Building?',
      'ja': 'オーチャード シェラトン ビルへはどうやって行けばいいですか?',
      'zh_Hans': '如何前往乌节喜来登大厦？',
    },
    'bnf8soel': {
      'en':
          '1. You are highly encouraged to use Grab or authorised transport channels.',
      'ja': '1. Grab または認可された交通手段のご利用を強くお勧めします。',
      'zh_Hans': '1. 强烈建议您使用 Grab 或授权的交通渠道。',
    },
    '9ehgs2po': {
      'en':
          '2. Nearest Station: BTS Skytrain, Krung Thep Maha Nakhon, 1.5km away from Orchird Sheraton Building.',
      'ja': '2. 最寄り駅：BTSスカイトレイン、クルンテープ・マハナコン駅、オーチャード・シェラトン・ビルから1.5km。',
      'zh_Hans':
          '2. 最近的车站：BTS Skytrain，Krung Thep Maha Nakhon，距离乌节喜来登大厦 1.5 公里。',
    },
    'qzldf2ej': {
      'en':
          '3. \nFrom Krung Thep Maha Nakhon Station, you can take the ferry at Sapan Taksin. Click on this link to get the step-by-step procedure. ',
      'ja':
          '3.\nクルンテープ・マハナコン駅からは、サパンタクシンでフェリーに乗ることができます。手順を順を追って説明するには、このリンクをクリックしてください。',
      'zh_Hans':
          '3. \n从 Krung Thep Maha Nakhon 站出发，您可以在 Sapan Taksin 乘坐渡轮。点击此链接了解分步流程。',
    },
    'kcwcldfi': {
      'en': 'What is the date and time of the Kick-Off Meeting?',
      'ja': 'キックオフミーティングの日時は何ですか?',
      'zh_Hans': '启动会议的日期和时间是什么？',
    },
    'e6wsj359': {
      'en':
          'The event will take place on [Date], starting at [Time]. Please make sure to arrive 15-30 minutes early for check-in.',
      'ja': 'イベントは [日付] の [時刻] に開催されます。チェックインのために 15 ～ 30 分前に到着するようにしてください。',
      'zh_Hans': '活动将于 [日期] 举行，开始时间为 [时间]。请务必提前 15-30 分钟到达以便签到。',
    },
    'qbw2ah3y': {
      'en': 'Where is the event taking place?',
      'ja': 'イベントはどこで開催されますか?',
      'zh_Hans': '活动在哪里举行？',
    },
    'mx1clvmn': {
      'en':
          'The meeting will be held at [Venue Name, Address]. You can find directions and parking information on the [Venue Page] within the app.',
      'ja': '会議は[会場名、住所]で開催されます。道順や駐車場の情報はアプリ内の[会場ページ]でご確認いただけます。',
      'zh_Hans': '会议将在[场地名称，地址]举行。您可以在应用程序内的[场地页面]上找到路线和停车信息。',
    },
    '2sicusiq': {
      'en': 'Is there parking available at the venue?',
      'ja': '会場に駐車場はありますか？',
      'zh_Hans': '会场有停车位吗？',
    },
    'tis8cnva': {
      'en':
          'Yes, [Number] of parking spots are available at the venue. Additional parking can be found at [Location]. Please follow the signs when you arrive.',
      'ja': 'はい、会場には [台数] の駐車スペースがあります。追加の駐車場は [場所] にあります。到着したら標識に従ってください。',
      'zh_Hans': '是的，会场有 [Number] 个停车位。[Location] 处有其他停车位。抵达后请按照指示牌行驶。',
    },
    'bxxcjqlk': {
      'en': 'What is the dress code of the event?',
      'ja': 'イベントのドレスコードは何ですか？',
      'zh_Hans': '此次活动的着装要求是什么？',
    },
    '68zolu82': {
      'en': 'Business casual attire is recommended.',
      'ja': 'ビジネスカジュアルな服装が推奨されます。',
      'zh_Hans': '建议穿商务休闲装。',
    },
    '25toaweu': {
      'en': 'Home',
      'ja': '家',
      'zh_Hans': '家',
    },
  },
  // FAQHealth
  {
    'zlp351tz': {
      'en': 'Health & Safety',
      'ja': '健康と安全',
      'zh_Hans': '健康与安全',
    },
    '38vwowk9': {
      'en': 'How do I get to Orchird Sheraton Building?',
      'ja': 'オーチャード シェラトン ビルへはどうやって行けばいいですか?',
      'zh_Hans': '如何前往乌节喜来登大厦？',
    },
    '8fgoqqr4': {
      'en':
          '1. You are highly encouraged to use Grab or authorised transport channels.',
      'ja': '1. Grab または認可された交通手段のご利用を強くお勧めします。',
      'zh_Hans': '1. 强烈建议您使用 Grab 或授权的交通渠道。',
    },
    'ycdd6vpp': {
      'en':
          '2. Nearest Station: BTS Skytrain, Krung Thep Maha Nakhon, 1.5km away from Orchird Sheraton Building.',
      'ja': '2. 最寄り駅：BTSスカイトレイン、クルンテープ・マハナコン駅、オーチャード・シェラトン・ビルから1.5km。',
      'zh_Hans':
          '2. 最近的车站：BTS Skytrain，Krung Thep Maha Nakhon，距离乌节喜来登大厦 1.5 公里。',
    },
    '8cdk02mg': {
      'en':
          '3. \nFrom Krung Thep Maha Nakhon Station, you can take the ferry at Sapan Taksin. Click on this link to get the step-by-step procedure. ',
      'ja':
          '3.\nクルンテープ・マハナコン駅からは、サパンタクシンでフェリーに乗ることができます。手順を順を追って説明するには、このリンクをクリックしてください。',
      'zh_Hans':
          '3. \n从 Krung Thep Maha Nakhon 站出发，您可以在 Sapan Taksin 乘坐渡轮。点击此链接获取分步流程。',
    },
    'bra02byj': {
      'en': 'What is the date and time of the Kick-Off Meeting?',
      'ja': 'キックオフミーティングの日時は何ですか?',
      'zh_Hans': '启动会议的日期和时间是什么？',
    },
    'gueezbsz': {
      'en':
          'The event will take place on [Date], starting at [Time]. Please make sure to arrive 15-30 minutes early for check-in.',
      'ja': 'イベントは [日付] の [時刻] に開催されます。チェックインのために 15 ～ 30 分前に到着するようにしてください。',
      'zh_Hans': '活动将于 [日期] 举行，开始时间为 [时间]。请务必提前 15-30 分钟到达并签到。',
    },
    '2yguryqa': {
      'en': 'Where is the event taking place?',
      'ja': 'イベントはどこで開催されますか?',
      'zh_Hans': '活动在哪里举行？',
    },
    'uo9gsucw': {
      'en':
          'The meeting will be held at [Venue Name, Address]. You can find directions and parking information on the [Venue Page] within the app.',
      'ja': '会議は[会場名、住所]で開催されます。道順や駐車場の情報はアプリ内の[会場ページ]でご確認いただけます。',
      'zh_Hans': '会议将在[场地名称，地址]举行。您可以在应用程序内的[场地页面]上找到路线和停车信息。',
    },
    'wiux32i8': {
      'en': 'Is there parking available at the venue?',
      'ja': '会場に駐車場はありますか？',
      'zh_Hans': '会场有停车位吗？',
    },
    'jr3xqjwa': {
      'en':
          'Yes, [Number] of parking spots are available at the venue. Additional parking can be found at [Location]. Please follow the signs when you arrive.',
      'ja': 'はい、会場には [台数] の駐車スペースがあります。追加の駐車場は [場所] にあります。到着したら標識に従ってください。',
      'zh_Hans': '是的，会场有 [Number] 个停车位。[Location] 处有其他停车位。抵达后请按照指示牌行驶。',
    },
    'wqncjws5': {
      'en': 'What is the dress code of the event?',
      'ja': 'イベントのドレスコードは何ですか？',
      'zh_Hans': '此次活动的着装要求是什么？',
    },
    '4l381v9k': {
      'en': 'Business casual attire is recommended.',
      'ja': 'ビジネスカジュアルな服装が推奨されます。',
      'zh_Hans': '建议穿商务休闲装。',
    },
    'fn884guq': {
      'en': 'Home',
      'ja': '家',
      'zh_Hans': '家',
    },
  },
  // Feedback
  {
    'xy1wmqjn': {
      'en': 'Name',
      'ja': '名前',
      'zh_Hans': '姓名',
    },
    '2mqavsnd': {
      'en': 'Home',
      'ja': '家',
      'zh_Hans': '家',
    },
    's47be5d1': {
      'en': 'Event Agenda',
      'ja': 'イベントアジェンダ',
      'zh_Hans': '活动议程',
    },
    'lny1shu9': {
      'en': 'Floor Plan',
      'ja': 'フロアプラン',
      'zh_Hans': '楼层平面图',
    },
    'bv25p1aa': {
      'en': 'Speakers Schedule',
      'ja': '講演スケジュール',
      'zh_Hans': '演讲者日程',
    },
    'rskgnf87': {
      'en': 'FAQ',
      'ja': 'よくある質問',
      'zh_Hans': '常问问题',
    },
    '8wsbb1h3': {
      'en': 'Feedback',
      'ja': 'フィードバック',
      'zh_Hans': '反馈',
    },
    '0q0pwasn': {
      'en': 'Speakers Session',
      'ja': 'スピーカーセッション',
      'zh_Hans': '演讲环节',
    },
    'xm5b97hd': {
      'en': 'End of event feedback',
      'ja': 'イベント終了時のフィードバック',
      'zh_Hans': '活动结束反馈',
    },
    '884d2ifs': {
      'en': 'Settings',
      'ja': '設定',
      'zh_Hans': '设置',
    },
    'blxnccud': {
      'en': 'Language options:',
      'ja': '言語オプション:',
      'zh_Hans': '语言选项:',
    },
    '7e5sbl8a': {
      'en': 'Please  your feedback of the session',
      'ja': '講演者のQRコードをスキャンしてセッションのフィードバックを送信してください。',
      'zh_Hans': '请扫描演讲者的二维码，提交您对本次会议的反馈',
    },
    'ewcu09l5': {
      'en': 'Home',
      'ja': '家',
      'zh_Hans': '家',
    },
  },
  // test
  {
    '0qn3ux3n': {
      'en': 'Page Title',
      'ja': '',
      'zh_Hans': '',
    },
    '1x7667hp': {
      'en': 'My Calendar',
      'ja': '',
      'zh_Hans': '',
    },
    'oebu5ly8': {
      'en': 'Home',
      'ja': '',
      'zh_Hans': '',
    },
  },
  // Personal
  {
    'fa0jcywt': {
      'en': 'Your QR Code',
      'ja': 'QRコード',
      'zh_Hans': '您的二维码',
    },
    'vsgjbya1': {
      'en': 'Ref ID',
      'ja': '参照ID',
      'zh_Hans': '参考编号',
    },
    '1490jca5': {
      'en': 'Name',
      'ja': '名前',
      'zh_Hans': '姓名',
    },
    'dm1dfgsy': {
      'en': 'Office Based Country',
      'ja': 'オフィス拠点国',
      'zh_Hans': '办事处所在地国家',
    },
    'jxzzg8kr': {
      'en': 'Check in Date',
      'ja': 'チェックイン日',
      'zh_Hans': '入住日期',
    },
    'ptsxxmti': {
      'en': 'Check out Date',
      'ja': 'チェックアウト日',
      'zh_Hans': '退房日期',
    },
    '61x3ab1d': {
      'en': 'Polo shirt\'s Size',
      'ja': 'ポロシャツのサイズ',
      'zh_Hans': 'Polo 衫尺码',
    },
    '5nkrcb18': {
      'en': 'Your Activity',
      'ja': 'あなたのアクティビティ',
      'zh_Hans': '您的活动',
    },
    '8rcqjmhz': {
      'en': 'Logout',
      'ja': 'ログアウト',
      'zh_Hans': '登出',
    },
    '66d3c835': {
      'en': 'Home',
      'ja': '家',
      'zh_Hans': '家',
    },
  },
  // Profile08
  {
    'n9h45gr8': {
      'en': 'David Jerome',
      'ja': '',
      'zh_Hans': '',
    },
    '5ua3ji5m': {
      'en': 'David.j@gmail.com',
      'ja': '',
      'zh_Hans': '',
    },
    'ts6j9pud': {
      'en': 'Passenger Documents',
      'ja': '',
      'zh_Hans': '',
    },
    'jni8derj': {
      'en': 'Tracker Notifications',
      'ja': '',
      'zh_Hans': '',
    },
    '5d9ihf1k': {
      'en': 'Help Center',
      'ja': '',
      'zh_Hans': '',
    },
    '88pwv257': {
      'en': 'Settings',
      'ja': '',
      'zh_Hans': '',
    },
    'fqb8vmj7': {
      'en': 'Phone Number',
      'ja': '',
      'zh_Hans': '',
    },
    '20dlkhro': {
      'en': 'Add Number',
      'ja': '',
      'zh_Hans': '',
    },
    'tv65vsxr': {
      'en': 'Language',
      'ja': '',
      'zh_Hans': '',
    },
    '1t7so7m7': {
      'en': 'English (eng)',
      'ja': '',
      'zh_Hans': '',
    },
    't3fc27tv': {
      'en': 'Currency',
      'ja': '',
      'zh_Hans': '',
    },
    '5obns1rq': {
      'en': 'US Dollar (\$)',
      'ja': '',
      'zh_Hans': '',
    },
    '0ik940tz': {
      'en': 'Profile Settings',
      'ja': '',
      'zh_Hans': '',
    },
    'bcgfva5q': {
      'en': 'Edit Profile',
      'ja': '',
      'zh_Hans': '',
    },
    '4ubeqpi2': {
      'en': 'Notification Settings',
      'ja': '',
      'zh_Hans': '',
    },
    'j9150zqp': {
      'en': 'Log out of account',
      'ja': '',
      'zh_Hans': '',
    },
    '1ab1kpkz': {
      'en': 'Log Out?',
      'ja': '',
      'zh_Hans': '',
    },
    'a1jn31c9': {
      'en': 'Home',
      'ja': '家',
      'zh_Hans': '家',
    },
  },
  // post
  {
    'vsllm6oi': {
      'en': 'Coffee Farm Tours',
      'ja': '',
      'zh_Hans': '',
    },
    '1k3ln8vy': {
      'en': '3.1k Members',
      'ja': '',
      'zh_Hans': '',
    },
    'tkvkuwig': {
      'en':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
      'ja': '',
      'zh_Hans': '',
    },
    '81wn8l5b': {
      'en': 'Alexandria Smith',
      'ja': '',
      'zh_Hans': '',
    },
    'jbgaqvfk': {
      'en': '1m ago',
      'ja': '',
      'zh_Hans': '',
    },
    'm6adi3h8': {
      'en':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
      'ja': '',
      'zh_Hans': '',
    },
    '5fhm9hys': {
      'en': '3',
      'ja': '',
      'zh_Hans': '',
    },
    'qbugdo0w': {
      'en': 'likes',
      'ja': '',
      'zh_Hans': '',
    },
    't0bxzk6e': {
      'en': '8',
      'ja': '',
      'zh_Hans': '',
    },
    'dt0t7wuv': {
      'en': 'Comments',
      'ja': '',
      'zh_Hans': '',
    },
    'xxnrf65m': {
      'en': 'Randy Alcorn',
      'ja': '',
      'zh_Hans': '',
    },
    'k3iwfvqz': {
      'en':
          'I\'m not really sure about this section here aI think you should do soemthing cool!',
      'ja': '',
      'zh_Hans': '',
    },
    '857ftn7x': {
      'en': 'a min ago',
      'ja': '',
      'zh_Hans': '',
    },
    '05znyxqz': {
      'en': 'Sandra Smith',
      'ja': '',
      'zh_Hans': '',
    },
    'tc9stddb': {
      'en':
          'I\'m not really sure about this section here aI think you should do soemthing cool!',
      'ja': '',
      'zh_Hans': '',
    },
    '5temsv6g': {
      'en': 'a min ago',
      'ja': '',
      'zh_Hans': '',
    },
    '23jraa16': {
      'en': 'Write a Post',
      'ja': '',
      'zh_Hans': '',
    },
    'c77o4t5g': {
      'en': 'Home',
      'ja': '家',
      'zh_Hans': '家',
    },
  },
  // detailTeam
  {
    'htifpaqh': {
      'en': 'Position',
      'ja': '',
      'zh_Hans': '',
    },
    'fce1szfp': {
      'en': 'Department',
      'ja': '',
      'zh_Hans': '',
    },
    'mtwjonjf': {
      'en': 'Office Based Country',
      'ja': '',
      'zh_Hans': '',
    },
    '91gmb1sd': {
      'en': 'Year of service',
      'ja': '',
      'zh_Hans': '',
    },
    'n249ul7z': {
      'en': 'Home',
      'ja': '家',
      'zh_Hans': '家',
    },
  },
  // SessionPageold
  {
    'ztpr5r2q': {
      'en': 'Home',
      'ja': '家',
      'zh_Hans': '家',
    },
    '3588aith': {
      'en': 'Event Agenda',
      'ja': 'イベントアジェンダ',
      'zh_Hans': '活动议程',
    },
    'jqn6t68i': {
      'en': 'Floor Plan',
      'ja': 'フロアプラン',
      'zh_Hans': '楼层平面图',
    },
    'jf6tncs1': {
      'en': 'Speakers Schedule',
      'ja': '講演スケジュール',
      'zh_Hans': '演讲者日程',
    },
    'wd6gvtqe': {
      'en': 'FAQ',
      'ja': 'よくある質問',
      'zh_Hans': '常问问题',
    },
    '3hsdyeh4': {
      'en': 'Feedback',
      'ja': 'フィードバック',
      'zh_Hans': '反馈',
    },
    'f4oe1d7g': {
      'en': 'Settings',
      'ja': '設定',
      'zh_Hans': '设置',
    },
    'g3c2l2br': {
      'en': 'Language options:',
      'ja': '言語オプション:',
      'zh_Hans': '语言选项:',
    },
    'pt2uuhyy': {
      'en': 'Speaker Schedule',
      'ja': '講演スケジュール',
      'zh_Hans': '演讲者日程',
    },
    'vbsjn6pf': {
      'en': 'ALL',
      'ja': '',
      'zh_Hans': '',
    },
    'g4pz1srg': {
      'en': 'DAY 1',
      'ja': '',
      'zh_Hans': '',
    },
    'yrq4td8l': {
      'en': 'DAY 2',
      'ja': '',
      'zh_Hans': '',
    },
    'x4btq33f': {
      'en': 'DAY 3',
      'ja': '',
      'zh_Hans': '',
    },
    'uc43v1dk': {
      'en': 'DAY 4',
      'ja': '',
      'zh_Hans': '',
    },
    '9qr2rwkj': {
      'en': 'ALL',
      'ja': '',
      'zh_Hans': '',
    },
    'yktzhbtg': {
      'en': 'Home',
      'ja': '家',
      'zh_Hans': '家',
    },
  },
  // Gallery
  {
    '21pjjud3': {
      'en': 'Name',
      'ja': '名前',
      'zh_Hans': '姓名',
    },
    '0skxj5w5': {
      'en': 'Home',
      'ja': '家',
      'zh_Hans': '家',
    },
    'd1x8wxbb': {
      'en': 'Event Agenda',
      'ja': 'イベントアジェンダ',
      'zh_Hans': '活动议程',
    },
    'qs4q82gj': {
      'en': 'Floor Plan',
      'ja': 'フロアプラン',
      'zh_Hans': '楼层平面图',
    },
    'ofnh2ooh': {
      'en': 'Speakers Schedule',
      'ja': '講演スケジュール',
      'zh_Hans': '演讲者日程',
    },
    '7r9j1v9r': {
      'en': 'FAQ',
      'ja': 'よくある質問',
      'zh_Hans': '常问问题',
    },
    'cfq3guul': {
      'en': 'Feedback',
      'ja': 'フィードバック',
      'zh_Hans': '反馈',
    },
    'jhjp6ysu': {
      'en': 'Speakers Session',
      'ja': 'スピーカーセッション',
      'zh_Hans': '演讲环节',
    },
    'jyscabjk': {
      'en': 'End of event feedback',
      'ja': 'イベント終了時のフィードバック',
      'zh_Hans': '活动结束反馈',
    },
    'fkwfhx5x': {
      'en': 'Settings',
      'ja': '設定',
      'zh_Hans': '设置',
    },
    '83yn1zt5': {
      'en': 'Language options:',
      'ja': '言語オプション:',
      'zh_Hans': '语言选项:',
    },
    'c56m0jr5': {
      'en': 'Event Gallery',
      'ja': '講演者のQRコードをスキャンしてセッションのフィードバックを送信してください。',
      'zh_Hans': '请扫描演讲者的二维码，提交您对本次会议的反馈',
    },
    'a0bygtkd': {
      'en': 'Home',
      'ja': '家',
      'zh_Hans': '家',
    },
  },
  // TeamProfile
  {
    '0jbwp8qf': {
      'en': 'Home',
      'ja': '家',
      'zh_Hans': '家',
    },
    'o2nvpshp': {
      'en': 'Event Agenda',
      'ja': 'イベントアジェンダ',
      'zh_Hans': '活动议程',
    },
    'owqmwun6': {
      'en': 'Floor Plan',
      'ja': 'フロアプラン',
      'zh_Hans': '楼层平面图',
    },
    '9iky80uc': {
      'en': 'Speakers Schedule',
      'ja': '講演スケジュール',
      'zh_Hans': '演讲者日程',
    },
    'p91yrrrj': {
      'en': 'FAQ',
      'ja': 'よくある質問',
      'zh_Hans': '常问问题',
    },
    'y29u4l7c': {
      'en': 'Feedback',
      'ja': 'フィードバック',
      'zh_Hans': '反馈',
    },
    'zrj3jzuf': {
      'en': 'Settings',
      'ja': '設定',
      'zh_Hans': '设置',
    },
    'yf73hsu5': {
      'en': 'Language options:',
      'ja': '言語オプション:',
      'zh_Hans': '语言选项:',
    },
    '52le6yur': {
      'en': 'Team Profile',
      'ja': 'チームプロフィール',
      'zh_Hans': '团队简介',
    },
    '1au1sjcd': {
      'en': 'ALL',
      'ja': '全て',
      'zh_Hans': '全部',
    },
    '4nznck2y': {
      'en': 'Management',
      'ja': '管理',
      'zh_Hans': '管理',
    },
    '5qmyghq8': {
      'en': 'Australia',
      'ja': 'タイ',
      'zh_Hans': '泰国',
    },
    'pi5jgjbl': {
      'en': 'Belgium',
      'ja': '中国',
      'zh_Hans': '中国',
    },
    'kk3i7p2b': {
      'en': 'China',
      'ja': '日本',
      'zh_Hans': '日本',
    },
    'g2sbtyf5': {
      'en': 'Hong Kong',
      'ja': 'オーストラリア',
      'zh_Hans': '澳大利亚',
    },
    '7vxsyxje': {
      'en': 'India',
      'ja': 'シンガポール',
      'zh_Hans': '新加坡',
    },
    'r6dufjsc': {
      'en': 'Indonesia',
      'ja': '香港',
      'zh_Hans': '香港',
    },
    '2qgbf623': {
      'en': 'Japan',
      'ja': 'インドネシア',
      'zh_Hans': '印度尼西亚',
    },
    'v3vv826s': {
      'en': 'Malaysia',
      'ja': '',
      'zh_Hans': '',
    },
    'ozm3ps0n': {
      'en': 'New Zealand',
      'ja': '',
      'zh_Hans': '',
    },
    'tias8na1': {
      'en': 'Philippines',
      'ja': '',
      'zh_Hans': '',
    },
    '74y9gwvk': {
      'en': 'Singapore',
      'ja': '',
      'zh_Hans': '',
    },
    'p023b8a7': {
      'en': 'South Korea',
      'ja': '',
      'zh_Hans': '',
    },
    'otx50p25': {
      'en': 'Taiwan',
      'ja': '',
      'zh_Hans': '',
    },
    'wfftb05b': {
      'en': 'Thailand',
      'ja': '',
      'zh_Hans': '',
    },
    'h7jwqr1d': {
      'en': 'United States',
      'ja': '',
      'zh_Hans': '',
    },
    'rxo04tzz': {
      'en': 'Vietnam',
      'ja': '',
      'zh_Hans': '',
    },
    'tdpgjons': {
      'en': 'ALL',
      'ja': '',
      'zh_Hans': '',
    },
    'hg8sevpw': {
      'en': 'Home',
      'ja': '家',
      'zh_Hans': '家',
    },
  },
  // detailSpeaker
  {
    'h9ppwj7w': {
      'en': 'Home',
      'ja': '家',
      'zh_Hans': '家',
    },
  },
  // FAQAirport
  {
    '98zan438': {
      'en': 'Airport Map',
      'ja': '登録と参加',
      'zh_Hans': '报名及参与',
    },
    'bd5gff9i': {
      'en': 'Don Muang Airport Pick-up',
      'ja': 'オーチャード シェラトン ビルへはどうやって行けばいいですか?',
      'zh_Hans': '如何前往乌节喜来登大厦？',
    },
    '0251lxbj': {
      'en': 'Download PDF',
      'ja': '',
      'zh_Hans': '',
    },
    '74oev42i': {
      'en': 'Suvanrnabhumi Airport Pick-up',
      'ja': 'オーチャード シェラトン ビルへはどうやって行けばいいですか?',
      'zh_Hans': '如何前往乌节喜来登大厦？',
    },
    'bnpoda84': {
      'en': 'Download PDF',
      'ja': '',
      'zh_Hans': '',
    },
    'aqi27wxf': {
      'en': 'Home',
      'ja': '家',
      'zh_Hans': '家',
    },
  },
  // ActivityPic
  {
    'iesokm5d': {
      'en': 'Your Activity',
      'ja': 'あなたのアクティビティ',
      'zh_Hans': '您的活动',
    },
    'lov2xymr': {
      'en': 'Home',
      'ja': '家',
      'zh_Hans': '家',
    },
  },
  // SessionPage
  {
    '9f7bin30': {
      'en': 'Home',
      'ja': '家',
      'zh_Hans': '家',
    },
    '7lo0imex': {
      'en': 'Event Agenda',
      'ja': 'イベントアジェンダ',
      'zh_Hans': '活动议程',
    },
    'dru04bwn': {
      'en': 'Floor Plan',
      'ja': 'フロアプラン',
      'zh_Hans': '楼层平面图',
    },
    '0yflwfs5': {
      'en': 'Speakers Schedule',
      'ja': '講演スケジュール',
      'zh_Hans': '演讲者日程',
    },
    'nb0tykk7': {
      'en': 'FAQ',
      'ja': 'よくある質問',
      'zh_Hans': '常问问题',
    },
    '3lp5lax9': {
      'en': 'Feedback',
      'ja': 'フィードバック',
      'zh_Hans': '反馈',
    },
    'mx4cjeqy': {
      'en': 'Settings',
      'ja': '設定',
      'zh_Hans': '设置',
    },
    'tisav1vp': {
      'en': 'Language options:',
      'ja': '言語オプション:',
      'zh_Hans': '语言选项:',
    },
    'dxkrb58z': {
      'en': 'Speaker Schedule',
      'ja': 'チームプロフィール',
      'zh_Hans': '团队简介',
    },
    'xs17vq4f': {
      'en': 'Home',
      'ja': '家',
      'zh_Hans': '家',
    },
  },
  // noti
  {
    '059dt8lo': {
      'en': 'Push Notifications',
      'ja': '',
      'zh_Hans': '',
    },
    'c7aostrn': {
      'en':
          'Receive Push notifications from our application on a semi regular basis.',
      'ja': '',
      'zh_Hans': '',
    },
    '8rsdk3x1': {
      'en': 'Noti Permission',
      'ja': '',
      'zh_Hans': '',
    },
    '46mq9jcd': {
      'en': 'Go to  Home Page',
      'ja': '',
      'zh_Hans': '',
    },
    'illp6nuy': {
      'en': 'Test Notification',
      'ja': '',
      'zh_Hans': '',
    },
    'h0leajyt': {
      'en': 'Home',
      'ja': '家',
      'zh_Hans': '家',
    },
  },
  // OneSignal
  {
    'q27h31j0': {
      'en': 'Button',
      'ja': '',
      'zh_Hans': '',
    },
    '08x5g6ex': {
      'en': 'Page Title',
      'ja': '',
      'zh_Hans': '',
    },
    '1qqps292': {
      'en': 'Home',
      'ja': '家',
      'zh_Hans': '家',
    },
  },
  // SessionPageCopy
  {
    'r3cgmlg3': {
      'en': 'Home',
      'ja': '家',
      'zh_Hans': '家',
    },
    'v04c9hdv': {
      'en': 'Event Agenda',
      'ja': 'イベントアジェンダ',
      'zh_Hans': '活动议程',
    },
    '3ljby51p': {
      'en': 'Floor Plan',
      'ja': 'フロアプラン',
      'zh_Hans': '楼层平面图',
    },
    'odh8qf9i': {
      'en': 'Speakers Schedule',
      'ja': '講演スケジュール',
      'zh_Hans': '演讲者日程',
    },
    'oamgsc0v': {
      'en': 'FAQ',
      'ja': 'よくある質問',
      'zh_Hans': '常问问题',
    },
    'h1sdz4tt': {
      'en': 'Feedback',
      'ja': 'フィードバック',
      'zh_Hans': '反馈',
    },
    'ulmnpecr': {
      'en': 'Settings',
      'ja': '設定',
      'zh_Hans': '设置',
    },
    'p5xq653u': {
      'en': 'Language options:',
      'ja': '言語オプション:',
      'zh_Hans': '语言选项:',
    },
    'q03g568m': {
      'en': 'Team Profile',
      'ja': 'チームプロフィール',
      'zh_Hans': '团队简介',
    },
    'esshjxau': {
      'en': 'ALL',
      'ja': '全て',
      'zh_Hans': '全部',
    },
    'rpvr01aq': {
      'en': 'Management',
      'ja': '管理',
      'zh_Hans': '管理',
    },
    'knbo7e4s': {
      'en': 'Australia',
      'ja': 'タイ',
      'zh_Hans': '泰国',
    },
    'brh0ks28': {
      'en': 'Belgium',
      'ja': '中国',
      'zh_Hans': '中国',
    },
    '9p2mdxpw': {
      'en': 'China',
      'ja': '日本',
      'zh_Hans': '日本',
    },
    'e0s4yszy': {
      'en': 'Hong Kong',
      'ja': 'オーストラリア',
      'zh_Hans': '澳大利亚',
    },
    'utl6evpk': {
      'en': 'India',
      'ja': 'シンガポール',
      'zh_Hans': '新加坡',
    },
    'c0gexewz': {
      'en': 'Indonesia',
      'ja': '香港',
      'zh_Hans': '香港',
    },
    'jbps451k': {
      'en': 'Japan',
      'ja': 'インドネシア',
      'zh_Hans': '印度尼西亚',
    },
    '3q029oky': {
      'en': 'Malaysia',
      'ja': '',
      'zh_Hans': '',
    },
    'zncwpna9': {
      'en': 'New Zealand',
      'ja': '',
      'zh_Hans': '',
    },
    '3i4hw3r7': {
      'en': 'Philippines',
      'ja': '',
      'zh_Hans': '',
    },
    'fjxbi2bi': {
      'en': 'Singapore',
      'ja': '',
      'zh_Hans': '',
    },
    'hgomccb9': {
      'en': 'South Korea',
      'ja': '',
      'zh_Hans': '',
    },
    'htm1yvk4': {
      'en': 'Taiwan',
      'ja': '',
      'zh_Hans': '',
    },
    'sizpgw7h': {
      'en': 'Thailand',
      'ja': '',
      'zh_Hans': '',
    },
    'wx7a2fzu': {
      'en': 'United States',
      'ja': '',
      'zh_Hans': '',
    },
    'jcsnh4uj': {
      'en': 'Vietnam',
      'ja': '',
      'zh_Hans': '',
    },
    'oj8ubdrw': {
      'en': 'ALL',
      'ja': '',
      'zh_Hans': '',
    },
    'gya5g8iv': {
      'en': 'Home',
      'ja': '家',
      'zh_Hans': '家',
    },
  },
  // NAVBAR
  {
    'e3gvnohm': {
      'en': 'Home',
      'ja': '',
      'zh_Hans': '',
    },
    '1cu2hm72': {
      'en': 'Agenda',
      'ja': '',
      'zh_Hans': '',
    },
    'u4wlz120': {
      'en': 'Floorplan',
      'ja': '',
      'zh_Hans': '',
    },
  },
  // QRCode
  {
    '03ff6e25': {
      'en': 'Ref ID',
      'ja': '参照ID',
      'zh_Hans': '参考编号',
    },
  },
  // Miscellaneous
  {
    'cfyk5g1q': {
      'en': 'Please allow to open camera',
      'ja': '',
      'zh_Hans': '',
    },
    'tg5ij2ix': {
      'en': 'Allow to push notification',
      'ja': '',
      'zh_Hans': '',
    },
    '1fn1wy6p': {
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'x3jq9yi9': {
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'z9n3lmcs': {
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'emp8056p': {
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'zzxkubb2': {
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'flxn43zc': {
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'h2uub98q': {
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'tyv8o8ut': {
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'jdtf2p9p': {
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'qqdo0lz9': {
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    '9vfgte5u': {
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'sr7kylfx': {
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'ad7b41uy': {
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'q6kzw31f': {
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    '9psnvvmu': {
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    '2vnid9np': {
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'hm0hnkwr': {
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'c2w57u5u': {
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'ae90ckk5': {
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'n5r47wr2': {
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'xhdmal8d': {
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'i208rn3k': {
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'dfjm5o1c': {
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    '96ne0vf3': {
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'puyq3uyv': {
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
  },
].reduce((a, b) => a..addAll(b));
