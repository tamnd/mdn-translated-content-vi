---
title: Introduction
slug: Web/JavaScript/Guide/Introduction
page-type: guide
sidebar: jssidebar
---

{{PreviousNext("Web/JavaScript/Guide", "Web/JavaScript/Guide/Grammar_and_types")}}

Chương này giới thiệu về JavaScript và thảo luận về một số khái niệm cơ bản của ngôn ngữ này.

## Những gì bạn nên biết trước

Hướng dẫn này giả định bạn đã có những kiến thức nền tảng sau:

- Hiểu biết chung về Internet và World Wide Web ([WWW](/en-US/docs/Glossary/World_Wide_Web)).
- Kiến thức làm việc tốt về HyperText Markup Language ([HTML](/en-US/docs/Glossary/HTML)).
- Một số kinh nghiệm lập trình. Nếu bạn mới bắt đầu học lập trình, hãy thử một trong các hướng dẫn được liên kết trên trang chính về [JavaScript](/en-US/docs/Web/JavaScript).

## Tìm kiếm thông tin về JavaScript ở đâu

Tài liệu JavaScript trên MDN bao gồm:

- [Dynamic scripting with JavaScript](/en-US/docs/Learn_web_development/Core/Scripting) cung cấp các hướng dẫn JavaScript có cấu trúc dành cho người mới bắt đầu và giới thiệu các khái niệm cơ bản về lập trình và Internet.
- [JavaScript Guide](/en-US/docs/Web/JavaScript/Guide) (hướng dẫn này) cung cấp tổng quan về ngôn ngữ JavaScript và các đối tượng của nó.
- [JavaScript Reference](/en-US/docs/Web/JavaScript/Reference) cung cấp tài liệu tham khảo chi tiết về JavaScript.

## JavaScript là gì?

JavaScript là ngôn ngữ lập trình kịch bản hướng đối tượng, đa nền tảng, được dùng để làm cho các trang web trở nên tương tác (ví dụ: có các hiệu ứng động phức tạp, các nút có thể nhấp, menu popup, v.v.). Ngoài ra còn có các phiên bản JavaScript phía máy chủ nâng cao hơn như Node.js, cho phép bạn thêm nhiều chức năng hơn vào một trang web so với chỉ tải xuống tệp (chẳng hạn như cộng tác thời gian thực giữa nhiều máy tính). Bên trong môi trường máy chủ (ví dụ: trình duyệt web), JavaScript có thể được kết nối với các đối tượng của môi trường đó để cung cấp khả năng kiểm soát lập trình trên chúng.

JavaScript chứa một thư viện tiêu chuẩn các đối tượng như `Array`, `Map` và `Math`, cùng với một tập hợp cốt lõi các phần tử ngôn ngữ như toán tử, cấu trúc điều khiển và câu lệnh. JavaScript cốt lõi có thể được mở rộng cho nhiều mục đích khác nhau bằng cách bổ sung thêm các đối tượng; ví dụ:

- _Client-side JavaScript_ mở rộng ngôn ngữ cốt lõi bằng cách cung cấp các đối tượng để điều khiển trình duyệt và _Document Object Model_ (DOM) của nó. Ví dụ, các phần mở rộng phía client cho phép một ứng dụng đặt các phần tử trên một biểu mẫu HTML và phản hồi các sự kiện người dùng như nhấp chuột, nhập liệu vào biểu mẫu và điều hướng trang.
- _Server-side JavaScript_ mở rộng ngôn ngữ cốt lõi bằng cách cung cấp các đối tượng liên quan đến việc chạy JavaScript trên máy chủ. Ví dụ, các phần mở rộng phía máy chủ cho phép một ứng dụng giao tiếp với cơ sở dữ liệu, cung cấp tính liên tục thông tin từ lần gọi này sang lần gọi tiếp theo của ứng dụng, hoặc thực hiện thao tác tệp trên máy chủ.

Điều này có nghĩa là trong trình duyệt, JavaScript có thể thay đổi giao diện của trang web (DOM). Tương tự như vậy, JavaScript Node.js trên máy chủ có thể phản hồi các yêu cầu tùy chỉnh được gửi từ mã thực thi trong trình duyệt.

## JavaScript và Java

JavaScript và Java tương đồng nhau ở một số điểm nhưng về cơ bản khác nhau ở những điểm khác. Ngôn ngữ JavaScript giống với Java nhưng không có hệ thống kiểu tĩnh và kiểm tra kiểu chặt chẽ của Java. JavaScript tuân theo hầu hết cú pháp biểu thức, quy ước đặt tên và cấu trúc luồng điều khiển cơ bản của Java — đây là lý do tại sao nó được đổi tên từ LiveScript thành JavaScript.

Trái ngược với hệ thống lớp tại thời điểm biên dịch của Java được xây dựng bằng các khai báo, JavaScript hỗ trợ hệ thống thời gian chạy dựa trên một số ít kiểu dữ liệu đại diện cho các giá trị số, Boolean và chuỗi. JavaScript có mô hình đối tượng dựa trên prototype thay vì mô hình đối tượng dựa trên lớp phổ biến hơn. Mô hình dựa trên prototype cung cấp kế thừa động; nghĩa là, những gì được kế thừa có thể thay đổi theo từng đối tượng cụ thể. JavaScript cũng hỗ trợ các hàm mà không cần bất kỳ yêu cầu khai báo đặc biệt nào. Hàm có thể là thuộc tính của đối tượng, được thực thi như các phương thức kiểu lỏng.

JavaScript là ngôn ngữ có hình thức rất tự do so với Java. Bạn không cần phải khai báo tất cả các biến, lớp và phương thức. Bạn không cần phải quan tâm đến việc các phương thức có là public, private hay protected không, và bạn không cần phải triển khai các interface. Các biến, tham số và kiểu trả về của hàm không được gõ tường minh.

Java là ngôn ngữ lập trình dựa trên lớp được thiết kế để thực thi nhanh và an toàn kiểu. An toàn kiểu có nghĩa là, ví dụ, bạn không thể chuyển đổi một số nguyên Java thành tham chiếu đối tượng hoặc truy cập bộ nhớ riêng bằng cách làm hỏng bytecode Java. Mô hình dựa trên lớp của Java có nghĩa là các chương trình chỉ bao gồm các lớp và phương thức của chúng. Kế thừa lớp và kiểu mạnh của Java thường đòi hỏi các phân cấp đối tượng kết hợp chặt chẽ. Những yêu cầu này làm cho lập trình Java phức tạp hơn lập trình JavaScript.

Ngược lại, JavaScript được thừa hưởng tinh thần từ một dòng ngôn ngữ nhỏ hơn, kiểu động như HyperTalk và dBase. Các ngôn ngữ kịch bản này cung cấp công cụ lập trình cho nhiều đối tượng hơn vì cú pháp dễ hơn, chức năng tích hợp chuyên biệt và yêu cầu tối thiểu để tạo đối tượng.

| JavaScript                                                                                                                                                                              | Java                                                                                                                                                                                             |
| --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| Hướng đối tượng. Không phân biệt giữa các loại đối tượng. Kế thừa thông qua cơ chế prototype, và các thuộc tính và phương thức có thể được thêm vào bất kỳ đối tượng nào một cách động. | Dựa trên lớp. Các đối tượng được chia thành lớp và thực thể với tất cả kế thừa thông qua phân cấp lớp. Các lớp và thực thể không thể có thuộc tính hoặc phương thức được thêm vào một cách động. |
| Kiểu dữ liệu biến không được khai báo (kiểu động, kiểu lỏng).                                                                                                                           | Kiểu dữ liệu biến phải được khai báo (kiểu tĩnh, kiểu chặt).                                                                                                                                     |
| Không thể tự động ghi vào ổ đĩa cứng.                                                                                                                                                   | Có thể tự động ghi vào ổ đĩa cứng.                                                                                                                                                               |

## JavaScript và đặc tả ECMAScript

JavaScript được chuẩn hóa tại [Ecma International](https://ecma-international.org/) — hiệp hội châu Âu về chuẩn hóa hệ thống thông tin và truyền thông (ECMA trước đây là từ viết tắt của European Computer Manufacturers Association) để cung cấp một ngôn ngữ lập trình quốc tế, chuẩn hóa dựa trên JavaScript. Phiên bản chuẩn hóa của JavaScript này, được gọi là ECMAScript, hoạt động theo cùng một cách trong tất cả các ứng dụng hỗ trợ tiêu chuẩn. Các công ty có thể sử dụng ngôn ngữ tiêu chuẩn mở để phát triển triển khai JavaScript của riêng họ. Tiêu chuẩn ECMAScript được ghi lại trong đặc tả ECMA-262.

Tiêu chuẩn ECMA-262 cũng được [ISO](https://www.iso.org/home.html) (Tổ chức Tiêu chuẩn hóa Quốc tế) phê duyệt như là ISO-16262. Bạn cũng có thể tìm thấy đặc tả trên [trang web Ecma International](https://ecma-international.org/publications-and-standards/standards/ecma-262/). Đặc tả ECMAScript không mô tả Document Object Model (DOM), được chuẩn hóa bởi [World Wide Web Consortium (W3C)](https://www.w3.org/) và/hoặc [WHATWG (Web Hypertext Application Technology Working Group)](https://whatwg.org/). DOM định nghĩa cách các đối tượng tài liệu HTML được hiển thị cho kịch bản của bạn. Để hiểu rõ hơn về các công nghệ khác nhau được sử dụng khi lập trình với JavaScript, hãy tham khảo bài viết [JavaScript technologies overview](/en-US/docs/Web/JavaScript/Reference/JavaScript_technologies_overview).

### Tài liệu JavaScript so với đặc tả ECMAScript

Đặc tả ECMAScript là một tập hợp các yêu cầu để triển khai ECMAScript. Nó hữu ích nếu bạn muốn triển khai các tính năng ngôn ngữ tuân thủ tiêu chuẩn trong triển khai hoặc engine ECMAScript của mình (chẳng hạn như SpiderMonkey trong Firefox, hoặc V8 trong Chrome).

Tài liệu ECMAScript _không_ dành cho các lập trình viên kịch bản. Hãy sử dụng tài liệu JavaScript để tìm thông tin khi viết kịch bản.

Đặc tả ECMAScript sử dụng thuật ngữ và cú pháp có thể xa lạ với lập trình viên JavaScript. Mặc dù mô tả ngôn ngữ có thể khác nhau trong ECMAScript, bản thân ngôn ngữ vẫn như vậy. JavaScript hỗ trợ tất cả các chức năng được nêu trong đặc tả ECMAScript.

Tài liệu JavaScript mô tả các khía cạnh của ngôn ngữ phù hợp với lập trình viên JavaScript.

## Bắt đầu với JavaScript

Để bắt đầu với JavaScript, tất cả những gì bạn cần là một trình duyệt web hiện đại. Các phiên bản gần đây của [Firefox](https://www.firefox.com/en-US/), [Chrome](https://www.google.com/chrome/index.html), [Microsoft Edge](https://www.microsoft.com/en-us/edge) và [Safari](https://www.apple.com/safari/) đều hỗ trợ các tính năng được thảo luận trong hướng dẫn này.

Một công cụ rất hữu ích để khám phá JavaScript là JavaScript Console (đôi khi được gọi là Web Console, hoặc đơn giản là console): đây là một công cụ cho phép bạn nhập JavaScript và chạy nó trong trang hiện tại.

Các ảnh chụp màn hình ở đây hiển thị [Firefox Web Console](https://firefox-source-docs.mozilla.org/devtools-user/web_console/), nhưng tất cả các trình duyệt hiện đại đều đi kèm với một console hoạt động theo cách tương tự.

### Mở console

Các hướng dẫn chính xác để mở console khác nhau giữa các trình duyệt:

- [Mở console trong Firefox](https://firefox-source-docs.mozilla.org/devtools-user/web_console/#opening-the-web-console)
- [Mở console trong Chrome](https://developer.chrome.com/docs/devtools/open)
- [Mở console trong Microsoft Edge](https://learn.microsoft.com/en-us/microsoft-edge/devtools/console/)

### Nhập và chạy JavaScript

Console xuất hiện ở cuối cửa sổ trình duyệt. Dọc theo phần dưới của console là một dòng nhập mà bạn có thể dùng để nhập JavaScript, và kết quả xuất hiện trong bảng bên trên:

![A browser window with the web console open at the bottom, containing two lines of input and output. Text can be entered below that.](2019-04-04_00-15-29.png)

Console hoạt động theo đúng cách như `eval`: biểu thức được nhập cuối cùng sẽ được trả về. Để đơn giản, có thể hình dung rằng mỗi khi nhập điều gì đó vào console, nó thực ra được bao quanh bởi `console.log` xung quanh `eval`, như sau:

```js
console.log(eval("3 + 5"));
```

### Nhập nhiều dòng trong console

Theo mặc định, nếu bạn nhấn <kbd>Enter</kbd> (hoặc <kbd>Return</kbd>, tùy thuộc vào bàn phím của bạn) sau khi nhập một dòng mã, thì chuỗi bạn đã nhập sẽ được thực thi. Để nhập nhiều dòng:

- Nếu chuỗi bạn nhập chưa hoàn chỉnh (ví dụ, bạn đã nhập `function foo() {`) thì console sẽ xử lý <kbd>Enter</kbd> như một ngắt dòng và cho phép bạn nhập một dòng khác.
- Nếu bạn giữ <kbd>Shift</kbd> trong khi nhấn <kbd>Enter</kbd>, thì console sẽ xử lý đây như một ngắt dòng và cho phép bạn nhập một dòng khác.
- Chỉ trong Firefox, bạn có thể kích hoạt [chế độ nhập nhiều dòng](https://firefox-source-docs.mozilla.org/devtools-user/web_console/the_command_line_interpreter/index.html#multi-line-mode), trong đó bạn có thể nhập nhiều dòng trong một trình soạn thảo nhỏ, sau đó chạy toàn bộ khi bạn sẵn sàng.

Để bắt đầu viết JavaScript, hãy mở console, sao chép đoạn mã sau và dán vào dấu nhắc lệnh:

```js
(function () {
  "use strict";
  /* Start of your code */
  function greetMe(yourName) {
    alert(`Hello ${yourName}`);
  }

  greetMe("World");
  /* End of your code */
})();
```

Nhấn <kbd>Enter</kbd> để xem nó hoạt động trong trình duyệt của bạn!

## Tiếp theo là gì

Trong các trang tiếp theo, hướng dẫn này sẽ giới thiệu cho bạn về cú pháp và các tính năng ngôn ngữ JavaScript, để bạn có thể viết các ứng dụng phức tạp hơn.

Nhưng bây giờ, hãy nhớ luôn bao gồm `(function(){"use strict";` trước mã của bạn và thêm `})();` vào cuối mã của bạn. Các bài viết về [strict mode](/en-US/docs/Web/JavaScript/Reference/Strict_mode) và [IIFE](/en-US/docs/Glossary/IIFE) giải thích những điều đó làm gì, nhưng bây giờ chúng có thể được coi là thực hiện những điều sau:

1. Ngăn chặn các ngữ nghĩa trong JavaScript gây khó khăn cho người mới bắt đầu.
2. Ngăn chặn các đoạn mã được thực thi trong console tương tác với nhau (ví dụ: có điều gì đó được tạo ra trong một lần thực thi console được sử dụng cho một lần thực thi console khác).

{{PreviousNext("Web/JavaScript/Guide", "Web/JavaScript/Guide/Grammar_and_types")}}
