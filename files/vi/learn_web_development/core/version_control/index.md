---
title: Quản lý phiên bản
slug: Learn_web_development/Core/Version_control
page-type: learn-module
sidebar: learnsidebar
---

{{PreviousMenu("Learn_web_development/Core/Design_for_developers", "Learn_web_development/Core")}}

Các công cụ quản lý phiên bản (thường được gọi là **Hệ thống quản lý phiên bản** hay **VCS**) là một phần thiết yếu của quy trình làm việc lập trình hiện đại — để sao lưu mã, cộng tác trên các codebase, và quay lại các phiên bản trước đó khi cần thiết.

[Git](https://git-scm.com/) là một ví dụ về công cụ quản lý phiên bản. [GitHub](https://github.com/), mặt khác, là một trang web và cơ sở hạ tầng cung cấp máy chủ Git cùng với một số công cụ hữu ích để làm việc với các kho chứa mã Git, cả cá nhân và theo nhóm. GitHub cho phép bạn báo cáo sự cố với mã, xem xét mã cộng tác, và cung cấp các tính năng quản lý dự án như phân loại sự cố, giao nhiệm vụ, lập kế hoạch dự án, và nhiều hơn nữa.

Mô-đun này đưa bạn qua các kiến thức cơ bản về quản lý phiên bản bằng Git và GitHub.

## Điều kiện tiên quyết

- Một máy tính để bàn với Git được cài đặt trên đó (xem [trang tải xuống Git](https://git-scm.com/downloads/)).
- Một công cụ để sử dụng Git. Tùy thuộc vào cách bạn thích làm việc, bạn có thể sử dụng:
  - Một [ứng dụng GUI Git](https://git-scm.com/downloads/guis/) (chúng tôi khuyến nghị [GitHub Desktop](https://desktop.github.com/download/), [SourceTree](https://www.sourcetreeapp.com/) hoặc [Git Kraken](https://www.gitkraken.com/)).
  - Một cửa sổ dòng lệnh/terminal (xem [Khóa học cấp tốc về dòng lệnh](/en-US/docs/Learn_web_development/Getting_started/Environment_setup/Command_line) để giới thiệu).
- Một [tài khoản GitHub](https://github.com/signup). Nếu bạn chưa có, hãy đăng ký ngay bây giờ bằng đường liên kết được cung cấp.

## Hướng dẫn

- [Về GitHub và Git (từ GitHub)](https://docs.github.com/en/get-started/start-your-journey/about-github-and-git)
  - : Điều này đề cập đến Git và GitHub là gì, cách chúng hoạt động cùng nhau, và cách bắt đầu.
- [Hello, World (từ GitHub)](https://docs.github.com/en/get-started/start-your-journey/hello-world)
  - : Hướng dẫn thực hành này đi thẳng vào việc sử dụng GitHub, dạy các kiến thức cơ bản về Git như tạo kho chứa mã và nhánh, thực hiện commit, và mở và hợp nhất các yêu cầu kéo.
- [Sử dụng Git (từ GitHub)](https://docs.github.com/en/get-started/using-git)
  - : Sổ tay Git đi sâu hơn một chút, giải thích công cụ quản lý phiên bản là gì, kho chứa mã là gì, mô hình GitHub cơ bản hoạt động như thế nào, các lệnh Git và ví dụ, và nhiều hơn nữa.
- [Đóng góp cho một dự án (từ GitHub)](https://docs.github.com/en/get-started/exploring-projects-on-github/contributing-to-a-project)
  - : Fork các dự án là thiết yếu khi bạn muốn đóng góp cho mã của người khác. Hướng dẫn này giải thích cách thực hiện.
- [Về Yêu cầu kéo (từ GitHub)](https://docs.github.com/en/pull-requests/collaborating-with-pull-requests/proposing-changes-to-your-work-with-pull-requests/about-pull-requests)
  - : Hướng dẫn hữu ích để quản lý yêu cầu kéo. Các yêu cầu này là cách bạn đề xuất thay đổi mã cho kho chứa mã của người khác để họ có thể xem xét và hợp nhất chúng vào codebase chính.
- [Về sự cố (từ GitHub)](https://docs.github.com/en/issues/tracking-your-work-with-issues/learning-about-issues/about-issues)
  - : Các sự cố giống như một diễn đàn cho dự án GitHub của bạn, nơi mọi người có thể đặt câu hỏi và báo cáo vấn đề, và bạn có thể quản lý các cập nhật (ví dụ giao nhiệm vụ cho mọi người để sửa lỗi, làm rõ vấn đề, cho mọi người biết mọi thứ đã được sửa). Bài viết này cho bạn biết những gì bạn cần biết về các sự cố.

> [!NOTE]
> Khi bạn đi sâu hơn vào Git, bạn sẽ bắt đầu nhận ra rằng thật dễ để đi sai hướng khi bạn bắt đầu sử dụng các lệnh phức tạp hơn. Đừng lo lắng, ngay cả các nhà phát triển web chuyên nghiệp cũng thấy Git khó hiểu đôi khi, và thường giải quyết vấn đề bằng cách tìm kiếm giải pháp trên web, hoặc tham khảo các trang như [Flight rules for Git](https://github.com/k88hudson/git-flight-rules) và [Dangit, git!](https://dangitgit.com/).

> [!NOTE]
> Khóa học [Intro to Git](https://scrimba.com/intro-to-git-c0l4grs2sa) của Scrimba <sup>[_MDN learning partner_](/en-US/docs/MDN/Writing_guidelines/Learning_content#partner_links_and_embeds)</sup> cung cấp một giới thiệu thực hành về việc sử dụng Git và GitHub.

## Xem thêm

- Các chủ đề hữu ích khác được đề cập trong GitHub Docs bao gồm:
  - [Hiểu quy trình GitHub](https://docs.github.com/en/get-started/using-github/github-flow)
  - [Giải quyết xung đột hợp nhất](https://docs.github.com/en/pull-requests/collaborating-with-pull-requests/addressing-merge-conflicts)
  - [Bỏ qua các tệp với .gitignore](https://docs.github.com/en/get-started/git-basics/ignoring-files)
  - [Xác thực với GitHub](https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/about-authentication-to-github)
  - [Làm chủ markdown](https://docs.github.com/en/get-started/writing-on-github/getting-started-with-writing-and-formatting-on-github/basic-writing-and-formatting-syntax) (định dạng văn bản bạn viết trong PR, bình luận sự cố và các tệp `.md`).
  - [Bắt đầu với GitHub Pages](https://docs.github.com/en/pages/quickstart) (cách xuất bản demo và trang web trên GitHub).
- [Danh sách lệnh Git](https://git-scm.com/docs)
- [Learn Git branching](https://learngitbranching.js.org/)
- [Flight rules for Git](https://github.com/k88hudson/git-flight-rules) (một tuyển tập rất hữu ích về các cách đạt được những thứ cụ thể trong Git, bao gồm cách sửa chữa mọi thứ khi bạn đã làm sai).
- [Dangit, git!](https://dangitgit.com/) (một tuyển tập hữu ích khác, đặc biệt về các cách sửa chữa mọi thứ khi bạn đã làm sai).

{{PreviousMenu("Learn_web_development/Core/Design_for_developers", "Learn_web_development/Core")}}
