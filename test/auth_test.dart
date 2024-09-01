import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mocktail/mocktail.dart';
import 'package:bajarbd/model/models/register_model.dart';
import 'package:bajarbd/provider/providers.dart';
import 'mockauth_repos.dart'; // Import your mock class

void main() {
  // Define the mock RegisterModel
  final mockRegisterModel = RegisterModel(
    accessToken: 'mockToken',
    userId: 123, // Updated to int
    expiresIn: 3600,
    email: 'mockEmail@example.com',
    tokenType: 'Bearer',
    status: 200,
  );

  // Set up the mock behavior
  final mockAuthRepos = MockAuthRepos();

  // Define the behavior of the mock for the login method
  when(() => mockAuthRepos.Login(any(), any(), any()))
      .thenAnswer((_) async => mockRegisterModel);

  test('login returns success', () async {
    // Create a provider container with overridden dependencies
    final container = ProviderContainer(
      overrides: [
        authRepos.overrideWithValue(mockAuthRepos),
      ],
    );

    // Read the AuthProvider
    final aProvider = container.read(authProvider.notifier);

    // Call the login method and assert the result
    final result = await aProvider.Login("email@example.com", "password123");

    // Assert that the login was successful
    expect(result, mockRegisterModel.status);

    // Dispose the container after the test
    container.dispose();
  });
}
