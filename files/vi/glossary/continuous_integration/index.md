---
title: Continuous integration
slug: Glossary/Continuous_integration
page-type: glossary-definition
sidebar: glossarysidebar
---

Tích hợp liên tục (CI - Continuous Integration) là một thực hành phát triển phần mềm trong đó các thay đổi đối với mã nguồn được tích hợp thường xuyên vào nhánh chính.

Đây là một thực hành quan trọng khi một nhóm lập trình viên làm việc trên cùng một codebase. Trong tình huống này, các lập trình viên khác nhau có thể thực hiện các thay đổi chồng chéo lên mã cùng một lúc, mỗi người trên nhánh cá nhân của mình. Việc tích hợp thường xuyên các thay đổi của từng lập trình viên làm giảm khả năng xảy ra xung đột và giúp việc giải quyết xung đột trực quan hơn.

Như [Martin Fowler nhận xét](https://martinfowler.com/articles/continuousIntegration.html#EveryonePushesCommitsToTheMainlineEveryDay):

> Tích hợp về cơ bản là giao tiếp. Tích hợp cho phép lập trình viên thông báo cho các lập trình viên khác về những thay đổi họ đã thực hiện. Giao tiếp thường xuyên giúp mọi người biết nhanh chóng khi có thay đổi phát triển.

Một khía cạnh quan trọng của CI là tự động hóa build và kiểm thử: thông thường, trong hệ thống CI, ngay khi lập trình viên mở pull request để commit thay đổi lên nhánh chính, một quy trình tự động sẽ build sản phẩm và chạy các bài kiểm thử. Khi tất cả các bài kiểm thử đều thông qua, thay đổi có thể được xem xét bởi đồng nghiệp.
