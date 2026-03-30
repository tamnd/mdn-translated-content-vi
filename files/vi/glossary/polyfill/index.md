---
title: Polyfill
slug: Glossary/Polyfill
page-type: glossary-definition
sidebar: glossarysidebar
---

Polyfill là một đoạn mã (thường là JavaScript trên Web) được dùng để cung cấp chức năng hiện đại trên các trình duyệt cũ không hỗ trợ chức năng đó một cách tự nhiên.

Ví dụ, một polyfill có thể được dùng để mô phỏng chức năng của {{cssxref("text-shadow")}} trong IE7 bằng cách sử dụng các filter độc quyền của IE, hoặc mô phỏng đơn vị rem hay media query bằng cách dùng JavaScript để điều chỉnh kiểu dáng một cách động cho phù hợp, hoặc bất cứ điều gì bạn cần.

Lý do polyfill không được sử dụng độc quyền là vì muốn có chức năng tốt hơn và hiệu năng tốt hơn. Các triển khai gốc của API có thể làm nhiều hơn và nhanh hơn polyfill. Ví dụ, [polyfill cho Object.create](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/create#see_also) chỉ chứa các chức năng có thể thực hiện được trong một triển khai không gốc của Object.create.

Đôi khi, polyfill được dùng để giải quyết các vấn đề mà trình duyệt triển khai cùng một tính năng theo các cách khác nhau. Polyfill sử dụng các tính năng không chuẩn trong một trình duyệt nhất định để cung cấp cho JavaScript một cách tiếp cận tuân theo chuẩn để truy cập tính năng đó. Mặc dù lý do để polyfill như vậy ngày nay rất hiếm, nhưng nó đặc biệt phổ biến trong thời kỳ IE6 và Netscape khi mỗi trình duyệt triển khai JavaScript rất khác nhau. [Phiên bản đầu tiên của jQuery](https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.js) là ví dụ ban đầu của một polyfill. Về bản chất, nó là tập hợp các giải pháp thay thế cho từng trình duyệt cụ thể nhằm cung cấp cho các nhà phát triển JavaScript một API chung duy nhất hoạt động trên mọi trình duyệt. Vào thời điểm đó, các nhà phát triển JavaScript gặp vấn đề lớn khi cố gắng làm cho trang web của họ hoạt động trên tất cả các thiết bị vì có sự khác biệt đến mức trang web có thể phải được lập trình hoàn toàn khác và có giao diện người dùng rất khác nhau dựa trên trình duyệt của người dùng. Ngày nay, việc dùng polyfill để xử lý các triển khai đặc thù cho từng trình duyệt ít phổ biến hơn vì các trình duyệt hiện đại hầu hết triển khai một bộ API rộng lớn theo ngữ nghĩa chuẩn.

## Xem thêm

- [What is a polyfill?](https://remysharp.com/2010/10/08/what-is-a-polyfill) (bài viết của Remy Sharp, người tạo ra thuật ngữ này)
