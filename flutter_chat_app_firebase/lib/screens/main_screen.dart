import 'package:flutter/material.dart';
import 'package:flutter_chat_app_firebase/config/painting.dart';

class LoginSignUpScreen extends StatefulWidget {
  const LoginSignUpScreen({Key? key}) : super(key: key);

  @override
  _LoginSignUpScreenState createState() => _LoginSignUpScreenState();
}

class _LoginSignUpScreenState extends State<LoginSignUpScreen> {
  //SignUp state 관리를 위한 변수 선언
  bool isSignupScreen = true;

  //전송 버튼을 누를때 validation 기능이 작동하도록(값 유효성 검사에 따른 문자 출력 등) 글로벌 키 선언
  //Form 위젯으로 이 기능을 구현한다.
  final _formkey = GlobalKey<FormState>();

  //이 3개의 변수를 각각의 onSaved()에 value 값이 전달될 대마다 업데이트 한다.
  String userName = '';
  String userEmail = '';
  String userPassword = '';

  //_formkey를 활용한 validation 기능을 구현하기 위한 메소드
  void _tryValidation() {
    final isValid = _formkey.currentState!.validate();
    if (isValid) {
      _formkey.currentState!.save();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.backgroundColor,

      
      body: GestureDetector(
        onTap: () {
          //FocusScope -> 키보드 밖 부분을 터치했을때 자동으로 키패드가 내려가는 기능 구현을 위함.
          FocusScope.of(context).unfocus();
        },
        // Stack위젯을 사용하면 위젯들을 원하는 곳에 위치 시킬 수 있다.
        child: Stack(
          children: [
            // Positioned -> 상하 좌우로 위젯의 위치를 지정할 수 있는 위젯
            // 배경
            Positioned(
              // 해당 위젯을 상단에 위치시키기 위해서 top right reft를 0으로 설정
              top: 0,
              right: 0,
              left: 0,
              child: Container(
                height: 300,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage('images/red.jpg'),
                  fit: BoxFit.fill,
                )),
                child: Container(
                  padding: const EdgeInsets.only(top: 90, left: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // 크기와 폰트가 다른 한줄의 문장을 쓰기 위해 RichText 위젯
                      RichText(
                        text: TextSpan(
                          text: 'Welcome',
                          style: const TextStyle(
                            letterSpacing: 1,
                            fontSize: 25,
                            color: Colors.white,
                          ),
                          children: [
                            TextSpan(
                              text: isSignupScreen ? 'to Yummy Chat!' : ' back',
                              style: const TextStyle(
                                letterSpacing: 1,
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        isSignupScreen
                            ? 'signup to continue'
                            : 'signin to continue',
                        style: const TextStyle(
                          letterSpacing: 1,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            //텍스트 폼 필드 // Animated -> 애니메이션 기능 구현. Duraition 요소 필수
            AnimatedPositioned(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeIn,
              top: 180,
              child: AnimatedContainer(
                duration: const Duration(
                    milliseconds: 300), // 직접 바뀌는 요소는 여기이므로 여기에도 Animated 적용
                curve: Curves.easeIn,

                padding: const EdgeInsets.all(20),
                height: isSignupScreen ? 280 : 250,
                width: MediaQuery.of(context).size.width -
                    40, //MediaQuery가 작동하면 화면 크기가 바뀌어도 일정하게 유지된다.
                margin: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      // 투명도withOpacity(0.3),
                      color: Colors.black.withOpacity(0.3),
                      blurRadius: 15,
                      spreadRadius: 5,
                    )
                  ],
                ),
                child: SingleChildScrollView(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                //사용자가 로그인 버튼을 선택했다는 의미(Signup -> false)
                                isSignupScreen = false;
                              });
                            },
                            child: Column(
                              children: [
                                Text(
                                  'LOGIN',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: !isSignupScreen
                                        ? Palette.activeColor
                                        : Palette.textColor1,
                                  ),
                                ),

                                // inline if 라는 기능으로 dart 2.3부터 도입됨
                                // 한 컬랙션 안(여기서는 Column 위젯 내의 리스트 요소) 들을 예외적인 조건을 쉽게 지정하도록 해줌
                                // isSignupScreen이 아닐때에만 (LOGIN 스크린이 선택되었을 때만) 아래 밑줄을 출력
                                if (!isSignupScreen)
                                  Container(
                                    margin: const EdgeInsets.only(top: 3),
                                    height: 2,
                                    width: 55,
                                    color: Colors.orange,
                                  ),
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                //SignUp 메뉴를 사용자가 선택했다는 의미
                                isSignupScreen = true;
                              });
                            },
                            child: Column(
                              children: [
                                Text(
                                  'SIGNUP',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: isSignupScreen
                                        ? Palette.activeColor
                                        : Palette.textColor1,
                                  ),
                                ),
                                if (isSignupScreen)
                                  Container(
                                    margin: const EdgeInsets.only(top: 3),
                                    height: 2,
                                    width: 55,
                                    color: Colors.orange,
                                  ),
                              ],
                            ),
                          ),
                        ],
                      ),

                      //isSignupScreen 일때는 3개의 텍스트 필드 출력
                      if (isSignupScreen)
                        Container(
                          // 곧바로 Form 필드를 배치하지 않고 Container 로 감싸준 이유는 위치 조정을 위해서
                          padding: const EdgeInsets.only(top: 20),
                          // login 과 sign up을 할때 필요한 validation(id 비번이나 이메일 같은) 체크를 위해 Form 위젯 사용
                          child: Form(
                            // Form 위젯을 통해서 글로벌 키를 다룰 수 있다.
                            key: _formkey,

                            child: Column(
                              children: [
                                TextFormField(
                                  //TextFormField에 있는 key 를 통해서 로딩과 signup의 validation 구분해주기
                                  //모든 텍스트폼 필드에 각각 구분할 수 있는 키값을 부여해준다.
                                  //키 값으로 구분해줌으로써 작성한 필드 값이 뒤엉키는걸 막아준다.
                                  key: const ValueKey(1),

                                  //유효성 검사를 위한 코드
                                  validator: (value) {
                                    if (value!.isEmpty || value.length < 4) {
                                      return 'Please enter at least 4 characters.';
                                    }
                                    return null;
                                  },

                                  //onSaved -> 사용자가 입력한 벨류값을 저장하는 기능
                                  onSaved: (value) {
                                    userName = value!;
                                  },

                                  decoration: const InputDecoration(
                                      prefixIcon: Icon(
                                        Icons.account_circle,
                                        color: Palette.iconColor,
                                      ),
                                      // 아이콘을 둥글게 출력해주는 속성
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Palette.textColor1,
                                        ),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(35),
                                        ),
                                      ),
                                      // 해당 입력 창이 선택 되었을 때에도 같은 디자인으로 표시하기 위해 복붙
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Palette.textColor1,
                                        ),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(35),
                                        ),
                                      ),
                                      hintText: 'User Name',
                                      hintStyle: TextStyle(
                                        fontSize: 14,
                                        color: Palette.textColor1,
                                      ),
                                      contentPadding: EdgeInsets.all(
                                          10) // 크기가 너무 커서 줄임. 자주 사용하는 기능
                                      ),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                TextFormField(
                                  key: const ValueKey(2),
                                  validator: (value) {
                                    if (value!.isEmpty ||
                                        !value.contains('@')) {
                                      return 'Please enter a valid email address.';
                                    }
                                    return null;
                                  },
                                  onSaved: (value) {
                                    userEmail = value!;
                                  },
                                  decoration: const InputDecoration(
                                      prefixIcon: Icon(
                                        Icons.mail,
                                        color: Palette.iconColor,
                                      ),
                                      // 아이콘을 둥글게 출력해주는 속성
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Palette.textColor1,
                                        ),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(35),
                                        ),
                                      ),
                                      // 해당 입력 창이 선택 되었을 때에도 같은 디자인으로 표시하기 위해 복붙
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Palette.textColor1,
                                        ),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(35),
                                        ),
                                      ),
                                      hintText: 'E-mail',
                                      hintStyle: TextStyle(
                                        fontSize: 14,
                                        color: Palette.textColor1,
                                      ),
                                      contentPadding: EdgeInsets.all(
                                          10) // 크기가 너무 커서 줄임. 자주 사용하는 기능
                                      ),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                TextFormField(
                                  key: const ValueKey(3),
                                  validator: (value) {
                                    if (value!.isEmpty || value.length < 6) {
                                      return 'Please must be at least 7 letters long.';
                                    }
                                    return null;
                                  },
                                  onSaved: (value) {
                                    userPassword = value!;
                                  },
                                  decoration: const InputDecoration(
                                      prefixIcon: Icon(
                                        Icons.lock,
                                        color: Palette.iconColor,
                                      ),
                                      // 아이콘을 둥글게 출력해주는 속성
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Palette.textColor1,
                                        ),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(35),
                                        ),
                                      ),
                                      // 해당 입력 창이 선택 되었을 때에도 같은 디자인으로 표시하기 위해 복붙
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Palette.textColor1,
                                        ),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(35),
                                        ),
                                      ),
                                      hintText: 'Password',
                                      hintStyle: TextStyle(
                                        fontSize: 14,
                                        color: Palette.textColor1,
                                      ),
                                      contentPadding: EdgeInsets.all(
                                          10) // 크기가 너무 커서 줄임. 자주 사용하는 기능
                                      ),
                                ),
                              ],
                            ),
                          ),
                        ),

                      //isSignupScreen가 아닐때 (LOGIN 버튼을 선택했을 때) -> 텍스트 필드 두개 출력
                      if (!isSignupScreen)
                        Container(
                          margin: const EdgeInsets.only(top: 20),
                          child: Form(
                            key: _formkey,
                            child: Column(
                              children: [
                                TextFormField(
                                  key: const ValueKey(4),
                                  validator: (value) {
                                    if (value!.isEmpty ||
                                        !value.contains('@')) {
                                      return 'Please enter a valid email address.';
                                    }
                                    return null;
                                  },
                                  onSaved: (value) {
                                    userEmail = value!;
                                  },
                                  decoration: const InputDecoration(
                                      prefixIcon: Icon(
                                        Icons.email,
                                        color: Palette.iconColor,
                                      ),
                                      // 아이콘을 둥글게 출력해주는 속성
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Palette.textColor1,
                                        ),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(35),
                                        ),
                                      ),
                                      // 해당 입력 창이 선택 되었을 때에도 같은 디자인으로 표시하기 위해 복붙
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Palette.textColor1,
                                        ),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(35),
                                        ),
                                      ),
                                      hintText: 'E-mail',
                                      hintStyle: TextStyle(
                                        fontSize: 14,
                                        color: Palette.textColor1,
                                      ),
                                      contentPadding: EdgeInsets.all(
                                          10) // 크기가 너무 커서 줄임. 자주 사용하는 기능
                                      ),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                TextFormField(
                                  key: const ValueKey(5),
                                  validator: (value) {
                                    if (value!.isEmpty || value.length < 6) {
                                      return 'Please must be at least 7 letters long.';
                                    }
                                    return null;
                                  },
                                  onSaved: (value) {
                                    userPassword = value!;
                                  },
                                  decoration: const InputDecoration(
                                      prefixIcon: Icon(
                                        Icons.lock,
                                        color: Palette.iconColor,
                                      ),
                                      // 아이콘을 둥글게 출력해주는 속성
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Palette.textColor1,
                                        ),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(35),
                                        ),
                                      ),
                                      // 해당 입력 창이 선택 되었을 때에도 같은 디자인으로 표시하기 위해 복붙
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Palette.textColor1,
                                        ),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(35),
                                        ),
                                      ),
                                      hintText: 'Password',
                                      hintStyle: TextStyle(
                                        fontSize: 14,
                                        color: Palette.textColor1,
                                      ),
                                      contentPadding: EdgeInsets.all(
                                          10) // 크기가 너무 커서 줄임. 자주 사용하는 기능
                                      ),
                                ),
                              ],
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ),

            //전송 버튼
            AnimatedPositioned(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeIn,
              top: isSignupScreen ? 430 : 390, // 시작점이 위에서부터 430이라는 뜻
              //bottom: 0, // 이걸 하면 밑에서부터 0부터 시작해 위로 올라가기때문에 아래부터 다 차지한다
              right: 0,
              left: 0,
              child: Center(
                child: Container(
                  padding: const EdgeInsets.all(15),
                  height: 90,
                  width: 90,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50)),
                  // 큰 원 안의 작은 원 컨테이너
                  child: GestureDetector(
                    onTap: () {
                      _tryValidation();
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        //gradient 몇가지 색상이 섞여 출력 -> 따라서 colors는 리스트 형태
                        gradient: const LinearGradient(
                          colors: [
                            Colors.orange,
                            Colors.red,
                          ],
                          //그라데이션 시작과 끝 설정
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            spreadRadius: 1,
                            blurRadius: 1,
                            //offset -> 버튼으로부터 가지는 그림자의 수직 수평 거리
                            offset: const Offset(0, 1),
                          ),
                        ],
                      ),
                      child: const Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),

            //Google 로그인 버튼
            AnimatedPositioned(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeIn,
              top: isSignupScreen ? MediaQuery.of(context).size.height - 125 : 
              MediaQuery.of(context).size.height - 165,
              right: 0,
              left: 0,
              child: Column(
                children: [
                  Text(isSignupScreen ? 'or Signup with' : 'or Signin with'),
                  const SizedBox(
                    height: 10,
                  ),
                  TextButton.icon(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      primary: Colors.white,
                      minimumSize: const Size(155, 40),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      backgroundColor: Palette.googleColor,
                    ),
                    icon: const Icon(Icons.add),
                    label: const Text('Google'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
