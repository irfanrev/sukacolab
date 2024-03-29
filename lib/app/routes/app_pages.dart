import 'package:get/get.dart';

import '../modules/add_project/bindings/add_project_binding.dart';
import '../modules/add_project/views/add_project_view.dart';
import '../modules/bookmark/bindings/bookmark_binding.dart';
import '../modules/bookmark/views/bookmark_view.dart';
import '../modules/community/bindings/community_binding.dart';
import '../modules/community/views/community_view.dart';
import '../modules/forgot_password/bindings/forgot_password_binding.dart';
import '../modules/forgot_password/views/forgot_password_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/onboarding/bindings/onboarding_binding.dart';
import '../modules/onboarding/views/onboarding_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/edit_experience/bindings/profile_edit_experience_binding.dart';
import '../modules/profile/edit_experience/views/profile_edit_experience_view.dart';
import '../modules/profile/edit_licenses/bindings/profile_edit_licenses_binding.dart';
import '../modules/profile/edit_licenses/views/profile_edit_licenses_view.dart';
import '../modules/profile/edit_profile/bindings/profile_edit_profile_binding.dart';
import '../modules/profile/edit_profile/views/profile_edit_profile_view.dart';
import '../modules/profile/edit_resume/bindings/profile_edit_resume_binding.dart';
import '../modules/profile/edit_resume/views/profile_edit_resume_view.dart';
import '../modules/profile/edit_skill/bindings/profile_edit_skill_binding.dart';
import '../modules/profile/edit_skill/views/profile_edit_skill_view.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/project/bindings/project_binding.dart';
import '../modules/project/project_apply/bindings/project_project_apply_binding.dart';
import '../modules/project/project_apply/views/project_project_apply_view.dart';
import '../modules/project/views/project_view.dart';
import '../modules/project_detail/bindings/project_detail_binding.dart';
import '../modules/project_detail/views/project_detail_view.dart';
import '../modules/purpose_project/bindings/purpose_project_binding.dart';
import '../modules/purpose_project/views/purpose_project_view.dart';
import '../modules/register/bindings/register_binding.dart';
import '../modules/register/views/register_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.LOGIN;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => const RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.PROJECT,
      page: () => const ProjectView(),
      binding: ProjectBinding(),
      children: [
        GetPage(
          name: _Paths.PROJECT_PROJECT_APPLY,
          page: () => const ProjectProjectApplyView(),
          binding: ProjectProjectApplyBinding(),
        ),
      ],
    ),
    GetPage(
      name: _Paths.PROJECT_DETAIL,
      page: () => const ProjectDetailView(),
      binding: ProjectDetailBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => const ProfileView(),
      binding: ProfileBinding(),
      children: [
        GetPage(
          name: _Paths.PROFILE_EDIT_PROFILE,
          page: () => const ProfileEditProfileView(),
          binding: ProfileEditProfileBinding(),
        ),
        GetPage(
          name: _Paths.PROFILE_EDIT_EXPERIENCE,
          page: () => const ProfileEditExperienceView(),
          binding: ProfileEditExperienceBinding(),
        ),
        GetPage(
          name: _Paths.PROFILE_EDIT_LICENSES,
          page: () => const ProfileEditLicensesView(),
          binding: ProfileEditLicensesBinding(),
        ),
        GetPage(
          name: _Paths.PROFILE_EDIT_SKILL,
          page: () => const ProfileEditSkillView(),
          binding: ProfileEditSkillBinding(),
        ),
        GetPage(
          name: _Paths.PROFILE_EDIT_RESUME,
          page: () => const ProfileEditResumeView(),
          binding: ProfileEditResumeBinding(),
        ),
      ],
    ),
    GetPage(
      name: _Paths.BOOKMARK,
      page: () => const BookmarkView(),
      binding: BookmarkBinding(),
    ),
    GetPage(
      name: _Paths.COMMUNITY,
      page: () => const CommunityView(),
      binding: CommunityBinding(),
    ),
    GetPage(
      name: _Paths.PURPOSE_PROJECT,
      page: () => const PurposeProjectView(),
      binding: PurposeProjectBinding(),
    ),
    GetPage(
      name: _Paths.ADD_PROJECT,
      page: () => const AddProjectView(),
      binding: AddProjectBinding(),
    ),
    GetPage(
      name: _Paths.ONBOARDING,
      page: () => OnboardingView(),
      binding: OnboardingBinding(),
    ),
    GetPage(
      name: _Paths.FORGOT_PASSWORD,
      page: () => const ForgotPasswordView(),
      binding: ForgotPasswordBinding(),
    ),
  ];
}
