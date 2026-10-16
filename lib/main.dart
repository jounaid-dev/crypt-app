Widget _buildStartupPage(AccountService accountService) {
  return FutureBuilder<bool>(
    future: accountService.accountExists(),
    builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return const Scaffold(
          body: Center(child: CircularProgressIndicator()),
        );
      }

      if (snapshot.hasData && snapshot.data == true) {
        return FutureBuilder<String?>(
          future: accountService.getPublicEncryptionKey(),
          builder: (context, keySnapshot) {
            if (keySnapshot.connectionState == ConnectionState.waiting) {
              return const Scaffold(
                body: Center(child: CircularProgressIndicator()),
              );
            }

            // Unlock the session if there's a saved password
            final sessionService = SessionService.instance;
            final savedPassword = await sessionService.getSavedPassword();
            if (savedPassword != null) {
              sessionService.unlock(savedPassword);
            }

            return HomePage(
              uid: keySnapshot.data ?? "",
              isDarkMode: _isDarkMode,
              onThemeChanged: _onThemeChanged,
              onLanguageChanged: setLocale,
              showSplashScreen: _showSplashScreen,
              onSplashScreenChanged: _onSplashScreenChanged,
            );
          },
        );
      }

      return const WelcomePage();
    },
  );
}
