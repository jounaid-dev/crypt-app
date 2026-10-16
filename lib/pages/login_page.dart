SessionService.instance.unlock(cleanPassword);

        // Persist the master password so the app can restore the session
        // after a kill/reboot. This is safe because the password is never stored
        // in plaintext on disk - it's the same password the user entered.
        await SessionService.instance.savePassword(cleanPassword);

        // Start unlocking the private keys now, so the first chat opens
        // without pausing on a key derivation. Deliberately not awaited: the
        // user is already signed in at this point.
        unawaited(IdentityService.warmKeyCache(cleanPassword));

        CryptApp.restartStartup(context);
