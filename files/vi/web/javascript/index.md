---
title: JavaScript
slug: Web/JavaScript
page-type: landing-page
sidebar: jssidebar
---

**JavaScript** (**JS**) là ngôn ngữ lập trình thông dịch (hoặc {{Glossary("Just_In_Time_Compilation", "biên dịch just-in-time")}}) nhẹ với {{Glossary("First-class Function", "hàm hạng nhất")}}. Mặc dù được biết đến nhiều nhất là ngôn ngữ kịch bản cho các trang web, [nhiều môi trường không phải trình duyệt](https://en.wikipedia.org/wiki/JavaScript#Other_usage) cũng sử dụng nó, chẳng hạn như {{Glossary("Node.js")}}, [Apache CouchDB](https://couchdb.apache.org/) và [Adobe Acrobat](https://opensource.adobe.com/dc-acrobat-sdk-docs/acrobatsdk/). JavaScript là ngôn ngữ [dựa trên prototype](/en-US/docs/Glossary/Prototype-based_programming), [thu gom rác](/en-US/docs/Glossary/Garbage_collection), [động](/en-US/docs/Glossary/Dynamic_typing), hỗ trợ nhiều mô hình lập trình như mệnh lệnh, hàm, và hướng đối tượng.

Các khả năng động của JavaScript bao gồm xây dựng đối tượng lúc chạy, danh sách tham số biến đổi, biến hàm, tạo kịch bản động (thông qua [`eval`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/eval)), kiểm tra đối tượng (thông qua [`for...in`](/en-US/docs/Web/JavaScript/Reference/Statements/for...in) và [các tiện ích `Object`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object#static_methods)), và phục hồi mã nguồn (các hàm JavaScript lưu trữ văn bản nguồn và có thể được truy xuất thông qua [`toString()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Function/toString)).

Phần này dành riêng cho ngôn ngữ JavaScript và không bao gồm các phần đặc thù cho trang web hoặc các môi trường máy chủ khác. Để biết thông tin về {{Glossary("API", "API")}} đặc thù cho trang web, vui lòng xem [Web API](/en-US/docs/Web/API) và {{Glossary("DOM")}}.

Các tiêu chuẩn cho JavaScript là [Đặc tả Ngôn ngữ ECMAScript](https://tc39.es/ecma262/) (ECMA-262) và [Đặc tả API Quốc tế hóa ECMAScript](https://tc39.es/ecma402/) (ECMA-402). Ngay khi một trình duyệt triển khai tính năng nào đó, chúng tôi cố gắng tài liệu hóa nó. Điều này có nghĩa là trong những trường hợp một số [đề xuất tính năng ECMAScript mới](https://github.com/tc39/proposals) đã được triển khai trong các trình duyệt, tài liệu và ví dụ trong các bài viết MDN có thể sử dụng một số tính năng mới đó. Hầu hết thời gian, điều này xảy ra trong khoảng giữa [giai đoạn](https://tc39.es/process-document/) 3 và 4, và thường là trước khi đặc tả được công bố chính thức.

Đừng nhầm lẫn JavaScript với [ngôn ngữ lập trình Java](<https://en.wikipedia.org/wiki/Java_(programming_language)>) — **JavaScript _không phải_ là "Interpreted Java"**. Cả "Java" và "JavaScript" đều là nhãn hiệu hoặc nhãn hiệu đã đăng ký của Oracle tại Mỹ và các quốc gia khác. Tuy nhiên, hai ngôn ngữ lập trình này có cú pháp, ngữ nghĩa và cách sử dụng rất khác nhau.

Tài liệu JavaScript về các tính năng ngôn ngữ cốt lõi (thuần [ECMAScript](/en-US/docs/Web/JavaScript/Reference/JavaScript_technologies_overview), trong hầu hết các trường hợp) bao gồm:

- [Hướng dẫn JavaScript](/en-US/docs/Web/JavaScript/Guide)
- [Tài liệu tham khảo JavaScript](/en-US/docs/Web/JavaScript/Reference)

Để biết thêm thông tin về các đặc tả JavaScript và các công nghệ liên quan, xem [Tổng quan về công nghệ JavaScript](/en-US/docs/Web/JavaScript/Reference/JavaScript_technologies_overview).

## Hướng dẫn cho người mới bắt đầu

Các [mô-đun cốt lõi về học phát triển web](/en-US/docs/Learn_web_development/Core) của chúng tôi chứa các hướng dẫn hiện đại, cập nhật về các kiến thức cơ bản JavaScript.

- [Trang web đầu tiên của bạn: Thêm tính tương tác](/en-US/docs/Learn_web_development/Getting_started/Your_first_website/Adding_interactivity)
  - : Bài viết này cung cấp một chuyến tham quan ngắn gọn về JavaScript là gì và cách sử dụng nó, dành cho những người hoàn toàn mới với phát triển web.
- [Lập trình động với JavaScript](/en-US/docs/Learn_web_development/Core/Scripting)
  - : Mô-đun này tập trung vào các kiến thức cơ bản của ngôn ngữ JavaScript cốt lõi, cùng một số chủ đề quan trọng xung quanh — học các chủ đề này sẽ cho bạn nền tảng vững chắc để làm việc.
- [Các framework và thư viện JavaScript](/en-US/docs/Learn_web_development/Core/Frameworks_libraries)
  - : Các JavaScript framework là phần thiết yếu của phát triển web front-end hiện đại, cung cấp cho các nhà phát triển các công cụ đã được thử nghiệm và kiểm chứng để xây dựng các ứng dụng web có khả năng mở rộng và tương tác. Nhiều công ty hiện đại sử dụng framework như một phần tiêu chuẩn trong bộ công cụ của họ, vì vậy nhiều công việc phát triển front-end hiện nay yêu cầu kinh nghiệm với framework. Bộ bài viết này cung cấp điểm khởi đầu thoải mái để giúp bạn bắt đầu học framework.

## Hướng dẫn JavaScript

### Hướng dẫn ngôn ngữ cơ bản

- [Hướng dẫn JavaScript](/en-US/docs/Web/JavaScript/Guide)
  - : Hướng dẫn chi tiết hơn nhiều về ngôn ngữ JavaScript, dành cho những người đã có kinh nghiệm lập trình trong JavaScript hoặc ngôn ngữ khác.

### Trung cấp

- [Đối tượng JavaScript nâng cao](/en-US/docs/Learn_web_development/Extensions/Advanced_JavaScript_objects)
  - : Tính chất hướng đối tượng của JavaScript rất quan trọng để hiểu nếu bạn muốn nâng cao kiến thức về ngôn ngữ và viết mã hiệu quả hơn, vì vậy chúng tôi đã cung cấp mô-đun này để giúp bạn.
- [JavaScript bất đồng bộ](/en-US/docs/Learn_web_development/Extensions/Async_JS)
  - : Trong mô-đun này, chúng ta xem xét JavaScript {{Glossary("asynchronous", "bất đồng bộ")}}, tại sao nó quan trọng, và cách nó có thể được sử dụng để xử lý hiệu quả các hoạt động có thể gây chặn, chẳng hạn như tải tài nguyên từ máy chủ.
- [Web API phía client](/en-US/docs/Learn_web_development/Extensions/Client-side_APIs)
  - : Khám phá API là gì và cách sử dụng một số API phổ biến nhất mà bạn thường gặp trong công việc phát triển của mình.
- [Tổng quan ngôn ngữ JavaScript](/en-US/docs/Web/JavaScript/Guide/Language_overview)
  - : Tổng quan về cú pháp cơ bản và ngữ nghĩa của JavaScript dành cho những người đến từ các ngôn ngữ lập trình khác muốn nắm bắt nhanh.
- [Cấu trúc dữ liệu JavaScript](/en-US/docs/Web/JavaScript/Guide/Data_structures)
  - : Tổng quan về các cấu trúc dữ liệu có sẵn trong JavaScript.
- [So sánh bằng nhau và sự đồng nhất](/en-US/docs/Web/JavaScript/Guide/Equality_comparisons_and_sameness)
  - : JavaScript cung cấp ba phép so sánh giá trị khác nhau: so sánh bằng nghiêm ngặt sử dụng `===`, so sánh bằng lỏng lẻo sử dụng `==`, và phương thức {{jsxref("Object.is()")}}.
- [Khả năng liệt kê và quyền sở hữu của thuộc tính](/en-US/docs/Web/JavaScript/Guide/Enumerability_and_ownership_of_properties)
  - : Cách các phương thức khác nhau duyệt qua một nhóm thuộc tính đối tượng từng cái một xử lý khả năng liệt kê và quyền sở hữu của thuộc tính.
- [Closures](/en-US/docs/Web/JavaScript/Guide/Closures)
  - : Closure là sự kết hợp của một hàm và môi trường từ vựng trong đó hàm đó được khai báo.

### Nâng cao

- [Kế thừa và chuỗi prototype](/en-US/docs/Web/JavaScript/Guide/Inheritance_and_the_prototype_chain)
  - : Giải thích về kế thừa dựa trên prototype thường bị hiểu nhầm và đánh giá thấp.
- [Quản lý bộ nhớ](/en-US/docs/Web/JavaScript/Guide/Memory_management)
  - : Vòng đời bộ nhớ và thu gom rác trong JavaScript.

## Tài liệu tham khảo

Duyệt tài liệu [tham khảo JavaScript](/en-US/docs/Web/JavaScript/Reference) đầy đủ.

- [Đối tượng tiêu chuẩn](/en-US/docs/Web/JavaScript/Reference/Global_Objects)
  - : Tìm hiểu về các đối tượng tích hợp tiêu chuẩn: {{jsxref("Array")}}, {{jsxref("Boolean")}}, {{jsxref("Error")}}, {{jsxref("Function")}}, {{jsxref("JSON")}}, {{jsxref("Math")}}, {{jsxref("Number")}}, {{jsxref("Object")}}, {{jsxref("RegExp")}}, {{jsxref("String")}}, {{jsxref("Map")}}, {{jsxref("Set")}}, {{jsxref("WeakMap")}}, {{jsxref("WeakSet")}}, và các đối tượng khác.
- [Biểu thức và toán tử](/en-US/docs/Web/JavaScript/Reference/Operators)
  - : Tìm hiểu thêm về hành vi của các toán tử JavaScript {{jsxref("Operators/instanceof", "instanceof")}}, {{jsxref("Operators/typeof", "typeof")}}, {{jsxref("Operators/new", "new")}}, {{jsxref("Operators/this", "this")}}, [thứ tự ưu tiên toán tử](/en-US/docs/Web/JavaScript/Reference/Operators/Operator_precedence), và nhiều hơn nữa.
- [Câu lệnh và khai báo](/en-US/docs/Web/JavaScript/Reference/Statements)
  - : Tìm hiểu cách {{jsxref("Statements/do...while", "do-while")}}, {{jsxref("Statements/for...in", "for-in")}}, {{jsxref("Statements/for...of", "for-of")}}, {{jsxref("Statements/try...catch", "try-catch")}}, {{jsxref("Statements/let", "let")}}, {{jsxref("Statements/var", "var")}}, {{jsxref("Statements/const", "const")}}, {{jsxref("Statements/if...else", "if-else")}}, {{jsxref("Statements/switch", "switch")}}, và các câu lệnh và từ khóa JavaScript khác hoạt động.
- [Hàm](/en-US/docs/Web/JavaScript/Reference/Functions)
  - : Tìm hiểu cách làm việc với các hàm JavaScript để phát triển ứng dụng của bạn.
- [Classes](/en-US/docs/Web/JavaScript/Reference/Classes)
  - : Các class JavaScript là cách phù hợp nhất để thực hiện lập trình hướng đối tượng.
