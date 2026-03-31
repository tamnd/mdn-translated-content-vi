---
title: Giới thiệu Express/Node
slug: Learn_web_development/Extensions/Server-side/Express_Nodejs/Introduction
page-type: learn-module-chapter
sidebar: learnsidebar
---

{{NextMenu("Learn_web_development/Extensions/Server-side/Express_Nodejs/development_environment", "Learn_web_development/Extensions/Server-side/Express_Nodejs")}}

Trong bài viết Express đầu tiên này, chúng tôi trả lời các câu hỏi "Node là gì?" và "Express là gì?", và cho bạn cái nhìn tổng quan về điều gì làm cho framework web Express đặc biệt. Chúng tôi sẽ phác thảo các tính năng chính và hiển thị cho bạn một số khối xây dựng chính của ứng dụng Express (mặc dù ở thời điểm này bạn chưa có môi trường phát triển để kiểm tra nó).

<table>
  <tbody>
    <tr>
      <th scope="row">Điều kiện tiên quyết:</th>
      <td>
        Hiểu biết chung về <a href="/en-US/docs/Learn_web_development/Extensions/Server-side/First_steps">lập trình web phía máy chủ</a>, và đặc biệt là cơ chế của <a href="/en-US/docs/Learn_web_development/Extensions/Server-side/First_steps/Client-Server_overview">tương tác máy khách-máy chủ trong các trang web</a>.
      </td>
    </tr>
    <tr>
      <th scope="row">Mục tiêu:</th>
      <td>
        Để làm quen với Express là gì và cách nó phù hợp với Node, những chức năng nó cung cấp và các khối xây dựng chính của ứng dụng Express.
      </td>
    </tr>
  </tbody>
</table>

## Giới thiệu Node

[Node](https://nodejs.org/) (hay chính thức hơn là _Node.js_) là một môi trường thực thi mã nguồn mở, đa nền tảng cho phép các nhà phát triển tạo mọi loại công cụ và ứng dụng phía máy chủ bằng [JavaScript](/en-US/docs/Glossary/JavaScript).
Môi trường thực thi được thiết kế để sử dụng bên ngoài ngữ cảnh trình duyệt (tức là, chạy trực tiếp trên hệ điều hành máy tính hoặc máy chủ). Do đó, môi trường bỏ qua các JavaScript API dành riêng cho trình duyệt và thêm hỗ trợ cho các API hệ điều hành truyền thống hơn bao gồm các thư viện HTTP và hệ thống tệp.

Từ quan điểm phát triển máy chủ web, Node có một số lợi ích:

- Hiệu suất tuyệt vời! Node được thiết kế để tối ưu hóa thông lượng và khả năng mở rộng trong các ứng dụng web và là giải pháp tốt cho nhiều vấn đề phát triển web phổ biến (ví dụ: ứng dụng web thời gian thực).
- Mã được viết bằng "JavaScript thuần túy", có nghĩa là ít thời gian hơn được dành để đối phó với "chuyển đổi ngữ cảnh" giữa các ngôn ngữ khi bạn đang viết cả mã phía máy khách và phía máy chủ.
- JavaScript là một ngôn ngữ lập trình tương đối mới và được hưởng lợi từ các cải tiến trong thiết kế ngôn ngữ so với các ngôn ngữ máy chủ web truyền thống khác (ví dụ: Python, PHP, v.v.) Nhiều ngôn ngữ mới và phổ biến khác biên dịch/chuyển đổi sang JavaScript, vì vậy bạn cũng có thể sử dụng TypeScript, CoffeeScript, ClojureScript, Scala, LiveScript, v.v.
- Trình quản lý gói node (npm) cung cấp quyền truy cập vào hàng trăm nghìn gói có thể tái sử dụng. Nó cũng có khả năng phân giải phụ thuộc tốt nhất trong ngành và cũng có thể được sử dụng để tự động hóa hầu hết các chuỗi công cụ xây dựng.
- Node.js có tính di động. Nó có sẵn trên Microsoft Windows, macOS, Linux, Solaris, FreeBSD, OpenBSD, WebOS và NonStop OS. Hơn nữa, nó được hỗ trợ tốt bởi nhiều nhà cung cấp lưu trữ web, thường cung cấp cơ sở hạ tầng và tài liệu cụ thể để lưu trữ các trang web Node.
- Nó có hệ sinh thái bên thứ ba và cộng đồng nhà phát triển rất năng động, với nhiều người sẵn sàng giúp đỡ.

Bạn có thể sử dụng Node.js để tạo một máy chủ web đơn giản bằng gói HTTP của Node.

### Xin chào Node.js

Ví dụ sau tạo một máy chủ web lắng nghe bất kỳ loại yêu cầu HTTP nào trên URL `http://127.0.0.1:8000/` — khi nhận được yêu cầu, script sẽ phản hồi với chuỗi: "Hello World". Nếu bạn đã cài đặt node, bạn có thể làm theo các bước sau để thử ví dụ:

1. Mở Terminal (trên Windows, mở tiện ích dòng lệnh)
2. Tạo thư mục nơi bạn muốn lưu chương trình, ví dụ: `test-node` rồi nhập vào đó bằng cách nhập lệnh sau vào terminal của bạn:

   ```bash
   cd test-node
   ```

3. Sử dụng trình soạn thảo văn bản yêu thích của bạn, tạo một tệp có tên `hello.js` và dán mã sau vào đó:

   ```js
   // Load HTTP module
   const http = require("http");

   const hostname = "127.0.0.1";
   const port = 8000;

   // Create HTTP server
   const server = http.createServer((req, res) => {
     // Set the response HTTP header with HTTP status and Content type
     res.writeHead(200, { "Content-Type": "text/plain" });

     // Send the response body "Hello World"
     res.end("Hello World\n");
   });

   // Prints a log once the server starts listening
   server.listen(port, hostname, () => {
     console.log(`Server running at http://${hostname}:${port}/`);
   });
   ```

4. Lưu tệp vào thư mục bạn đã tạo ở trên.
5. Quay lại terminal và gõ lệnh sau:

   ```bash
   node hello.js
   ```

Cuối cùng, điều hướng đến `http://localhost:8000` trong trình duyệt web của bạn; bạn sẽ thấy văn bản "**Hello World**" ở góc trên bên trái của một trang web trống.

> [!NOTE]
> Nếu bạn muốn thử một số mã Node.js mà không cần thiết lập cục bộ, Scrimba có [Aside: The HTTP module](https://scrimba.com/learn-nodejs-c00ho9qqh6/~07du?via=mdn) <sup>[_Đối tác học tập MDN_](/en-US/docs/MDN/Writing_guidelines/Learning_content#partner_links_and_embeds)</sup> cung cấp hướng dẫn tương tác về cách thiết lập máy chủ cơ bản với gói HTTP của Node.

## Các Framework web

Các tác vụ phát triển web phổ biến khác không được Node hỗ trợ trực tiếp. Nếu bạn muốn thêm xử lý cụ thể cho các phương thức HTTP khác nhau (ví dụ: `GET`, `POST`, `DELETE`, v.v.), xử lý riêng các yêu cầu tại các đường dẫn URL khác nhau ("route"), phục vụ các tệp tĩnh hoặc sử dụng mẫu để tạo động phản hồi, Node sẽ không hữu ích lắm khi tự mình thực hiện. Bạn cần tự viết mã, hoặc bạn có thể tránh tái phát minh bánh xe và sử dụng một framework web!

## Giới thiệu Express

[Express](https://expressjs.com/) là framework web Node.js phổ biến nhất, và là thư viện nền tảng cho một số framework Node.js phổ biến khác. Nó cung cấp các cơ chế để:

- Viết các trình xử lý cho các yêu cầu với các phương thức HTTP khác nhau tại các đường dẫn URL khác nhau (route).
- Tích hợp với các công cụ render "view" để tạo phản hồi bằng cách chèn dữ liệu vào các mẫu.
- Đặt các cài đặt ứng dụng web phổ biến như cổng để sử dụng để kết nối và vị trí của các mẫu được sử dụng để render phản hồi.
- Thêm middleware xử lý yêu cầu bổ sung tại bất kỳ điểm nào trong đường ống xử lý yêu cầu.

Mặc dù _Express_ bản thân khá tối giản, các nhà phát triển đã tạo các gói middleware tương thích để giải quyết hầu hết mọi vấn đề phát triển web. Có các thư viện để làm việc với cookie, phiên, đăng nhập người dùng, tham số URL, dữ liệu `POST`, tiêu đề bảo mật và _nhiều_ hơn nữa. Bạn có thể tìm thấy danh sách các gói middleware được duy trì bởi nhóm Express tại [Express Middleware](https://expressjs.com/en/resources/middleware.html) (cùng với danh sách một số gói bên thứ ba phổ biến).

> [!NOTE]
> Tính linh hoạt này là con dao hai lưỡi. Có các gói middleware để giải quyết hầu hết mọi vấn đề hoặc yêu cầu, nhưng việc tìm ra các gói phù hợp để sử dụng đôi khi có thể là một thách thức. Cũng không có "cách đúng" để cấu trúc ứng dụng và nhiều ví dụ bạn có thể tìm thấy trên Internet không tối ưu, hoặc chỉ hiển thị một phần nhỏ những gì bạn cần làm để phát triển ứng dụng web.

## Node và Express đến từ đâu?

Node ban đầu được phát hành, chỉ cho Linux, vào năm 2009. Trình quản lý gói npm được phát hành vào năm 2010 và hỗ trợ Windows gốc được thêm vào năm 2012. Hãy xem [Wikipedia](https://en.wikipedia.org/wiki/Node.js#History) nếu bạn muốn biết thêm.

Express ban đầu được phát hành vào tháng 11 năm 2010 và hiện đang ở phiên bản chính 5 của API. Bạn có thể xem [changelog](https://expressjs.com/en/changelog/#5.x) để biết thông tin về các thay đổi trong bản phát hành hiện tại và [GitHub](https://github.com/expressjs/express/blob/master/History.md) để biết ghi chú phát hành lịch sử chi tiết hơn.

## Node và Express có phổ biến không?

Sự phổ biến của một framework web là quan trọng vì nó là chỉ số về việc nó có tiếp tục được duy trì hay không và những tài nguyên nào có thể có sẵn về tài liệu, thư viện bổ sung và hỗ trợ kỹ thuật.

Không có biện pháp sẵn có và dứt khoát nào về sự phổ biến của các framework phía máy chủ (mặc dù bạn có thể ước tính sự phổ biến bằng cách sử dụng các cơ chế như đếm số lượng dự án GitHub và câu hỏi Stack Overflow cho mỗi nền tảng). Câu hỏi tốt hơn là liệu Node và Express có "đủ phổ biến" để tránh các vấn đề của các nền tảng không phổ biến hay không. Chúng có tiếp tục phát triển không? Bạn có thể nhận được trợ giúp nếu cần không? Có cơ hội để bạn được trả lương nếu bạn học Express không?

Dựa trên số lượng các công ty nổi tiếng sử dụng Express, số lượng người đóng góp vào cơ sở mã và số lượng người cung cấp hỗ trợ miễn phí và có trả phí, thì có, _Express_ là một framework phổ biến!

## Express có áp đặt quan điểm không?

Các framework web thường tự gọi mình là "áp đặt quan điểm" hoặc "không áp đặt quan điểm".

Các framework áp đặt quan điểm là những framework có ý kiến về "cách đúng" để xử lý bất kỳ nhiệm vụ cụ thể nào. Chúng thường hỗ trợ phát triển nhanh _trong một lĩnh vực cụ thể_ (giải quyết các vấn đề của một loại cụ thể) vì cách đúng để làm bất cứ điều gì thường được hiểu rõ và được ghi lại đầy đủ. Tuy nhiên chúng có thể kém linh hoạt hơn trong việc giải quyết các vấn đề bên ngoài lĩnh vực chính của họ và có xu hướng cung cấp ít lựa chọn hơn về những thành phần và phương pháp nào họ có thể sử dụng.

Các framework không áp đặt quan điểm, ngược lại, có ít hạn chế hơn về cách tốt nhất để ghép các thành phần lại với nhau để đạt được mục tiêu, hoặc thậm chí các thành phần nào nên được sử dụng. Chúng giúp các nhà phát triển dễ dàng sử dụng các công cụ phù hợp nhất để hoàn thành một nhiệm vụ cụ thể, mặc dù với chi phí là bạn cần tự tìm những thành phần đó.

Express không áp đặt quan điểm. Bạn có thể chèn hầu hết bất kỳ middleware tương thích nào vào chuỗi xử lý yêu cầu, theo hầu hết bất kỳ thứ tự nào bạn thích. Bạn có thể cấu trúc ứng dụng trong một tệp hoặc nhiều tệp và sử dụng bất kỳ cấu trúc thư mục nào. Đôi khi bạn có thể cảm thấy bạn có quá nhiều lựa chọn!

## Mã Express trông như thế nào?

Trong một trang web hướng dữ liệu truyền thống, ứng dụng web chờ các yêu cầu HTTP từ trình duyệt web (hoặc máy khách khác). Khi nhận được yêu cầu, ứng dụng tìm ra hành động nào cần dựa trên mẫu URL và có thể thông tin liên quan chứa trong dữ liệu `POST` hoặc dữ liệu `GET`. Tùy thuộc vào những gì được yêu cầu, nó có thể đọc hoặc ghi thông tin từ cơ sở dữ liệu hoặc thực hiện các tác vụ khác cần thiết để đáp ứng yêu cầu. Ứng dụng sẽ trả về phản hồi cho trình duyệt web, thường tạo động một trang HTML cho trình duyệt hiển thị bằng cách chèn dữ liệu được truy xuất vào các vị trí giữ chỗ trong mẫu HTML.

Express cung cấp các phương thức để chỉ định hàm nào được gọi cho một phương thức HTTP cụ thể (`GET`, `POST`, `PUT`, v.v.) và mẫu URL ("Route"), và các phương thức để chỉ định công cụ mẫu ("view") nào được sử dụng, nơi các tệp mẫu được đặt và mẫu nào để render phản hồi. Bạn có thể sử dụng middleware Express để thêm hỗ trợ cho cookie, phiên và người dùng, lấy tham số `POST`/`GET`, v.v. Bạn có thể sử dụng bất kỳ cơ chế cơ sở dữ liệu nào được Node hỗ trợ (Express không định nghĩa bất kỳ hành vi liên quan đến cơ sở dữ liệu nào).

Các phần sau đây giải thích một số điều phổ biến bạn sẽ thấy khi làm việc với mã _Express_ và _Node_.

### Xin chào thế giới với Express

Trước tiên hãy xem xét ví dụ [Hello World](https://expressjs.com/en/starter/hello-world.html) Express tiêu chuẩn (chúng tôi thảo luận từng phần bên dưới và trong các phần sau).

> [!NOTE]
> Nếu bạn đã cài đặt Node và Express (hoặc nếu bạn cài đặt chúng như được hiển thị trong [bài viết tiếp theo](/en-US/docs/Learn_web_development/Extensions/Server-side/Express_Nodejs/development_environment)), bạn có thể lưu mã này vào tệp văn bản có tên **app.js** và chạy nó trong dấu nhắc lệnh bash bằng cách gọi:
>
> **`node ./app.js`**

```js
const express = require("express");

const app = express();
const port = 3000;

app.get("/", (req, res) => {
  res.send("Hello World!");
});

app.listen(port, () => {
  console.log(`Example app listening on port ${port}!`);
});
```

Hai dòng đầu tiên `require()` (import) module express và tạo một [ứng dụng Express](https://expressjs.com/en/5x/api.html#app). Đối tượng này, thường được đặt tên là `app`, có các phương thức để định tuyến các yêu cầu HTTP, cấu hình middleware, render các HTML views, đăng ký công cụ mẫu và sửa đổi [cài đặt ứng dụng](https://expressjs.com/en/5x/api.html#app.settings.table) kiểm soát cách ứng dụng hoạt động (ví dụ: chế độ môi trường, liệu định nghĩa route có phân biệt chữ hoa chữ thường hay không, v.v.)

Phần giữa của mã (ba dòng bắt đầu bằng `app.get`) hiển thị một _định nghĩa route_. Phương thức `app.get()` chỉ định một hàm gọi lại sẽ được gọi bất cứ khi nào có yêu cầu HTTP `GET` với đường dẫn (`'/'`) tương đối so với gốc trang web. Hàm gọi lại lấy đối tượng yêu cầu và phản hồi làm đối số và gọi [`send()`](https://expressjs.com/en/5x/api.html#res.send) trên phản hồi để trả về chuỗi "Hello World!"

Khối cuối cùng khởi động máy chủ trên cổng chỉ định ('3000') và in nhận xét log vào console. Với máy chủ đang chạy, bạn có thể truy cập `localhost:3000` trong trình duyệt của mình để xem phản hồi ví dụ được trả về.

### Import và tạo module

Một module là thư viện/tệp JavaScript mà bạn có thể import vào mã khác bằng hàm `require()` của Node. _Express_ bản thân là một module, cũng như các thư viện middleware và cơ sở dữ liệu mà chúng tôi sử dụng trong các ứng dụng _Express_ của mình.

Mã bên dưới hiển thị cách chúng tôi import một module theo tên, sử dụng framework _Express_ làm ví dụ. Đầu tiên chúng tôi gọi hàm `require()`, chỉ định tên của module dưới dạng chuỗi (`'express'`) và gọi đối tượng được trả về để tạo một [ứng dụng Express](https://expressjs.com/en/5x/api.html#app). Sau đó chúng tôi có thể truy cập các thuộc tính và hàm của đối tượng ứng dụng.

```js
const express = require("express");

const app = express();
```

Bạn cũng có thể tạo các module của riêng mình có thể được import theo cách tương tự.

> [!NOTE]
> Bạn _sẽ muốn_ tạo các module của riêng mình, vì điều này cho phép bạn tổ chức mã thành các phần có thể quản lý — một ứng dụng đơn tệp nguyên khối khó hiểu và duy trì. Sử dụng các module cũng giúp bạn quản lý không gian tên của mình, vì chỉ các biến bạn export rõ ràng mới được import khi bạn sử dụng một module.

Để làm cho các đối tượng có sẵn bên ngoài một module, bạn chỉ cần expose chúng dưới dạng các thuộc tính bổ sung trên đối tượng `exports`. Ví dụ: module **square.js** bên dưới là một tệp export các phương thức `area()` và `perimeter()`:

```js
exports.area = function (width) {
  return width * width;
};
exports.perimeter = function (width) {
  return 4 * width;
};
```

Chúng tôi có thể import module này bằng `require()` và sau đó gọi các phương thức được export như được hiển thị:

```js
const square = require("./square"); // Here we require() the name of the file without the (optional) .js file extension

console.log(`The area of a square with a width of 4 is ${square.area(4)}`);
```

> [!NOTE]
> Bạn cũng có thể chỉ định đường dẫn tuyệt đối đến module (hoặc tên, như chúng tôi đã làm ban đầu).

Nếu bạn muốn export một đối tượng hoàn chỉnh trong một phép gán thay vì xây dựng nó từng thuộc tính một, hãy gán nó cho `module.exports` như được hiển thị bên dưới (bạn cũng có thể thực hiện điều này để làm cho gốc của đối tượng exports trở thành hàm khởi tạo hoặc hàm khác):

```js
module.exports = {
  area(width) {
    return width * width;
  },

  perimeter(width) {
    return 4 * width;
  },
};
```

> [!NOTE]
> Bạn có thể nghĩ `exports` là một [lối tắt](https://nodejs.org/api/modules.html#modules_exports_shortcut) đến `module.exports` trong một module nhất định. Trên thực tế, `exports` chỉ là một biến được khởi tạo thành giá trị của `module.exports` trước khi module được đánh giá. Giá trị đó là một tham chiếu đến một đối tượng (đối tượng trống trong trường hợp này). Điều này có nghĩa là `exports` giữ tham chiếu đến cùng đối tượng được tham chiếu bởi `module.exports`. Nó cũng có nghĩa là khi gán giá trị khác cho `exports`, nó không còn được ràng buộc với `module.exports`.

Để biết thêm thông tin về module, xem [Modules](https://nodejs.org/api/modules.html#modules_modules) (Tài liệu API Node).

### Sử dụng các API bất đồng bộ

Mã JavaScript thường xuyên sử dụng các API bất đồng bộ thay vì đồng bộ cho các hoạt động có thể mất một thời gian để hoàn thành. API đồng bộ là API trong đó mỗi hoạt động phải hoàn thành trước khi hoạt động tiếp theo có thể bắt đầu. Ví dụ: các hàm log sau đây là đồng bộ và sẽ in văn bản vào console theo thứ tự (First, Second).

```js
console.log("First");
console.log("Second");
```

Ngược lại, API bất đồng bộ là API trong đó API sẽ bắt đầu một hoạt động và ngay lập tức trả về (trước khi hoạt động hoàn thành). Một khi hoạt động kết thúc, API sẽ sử dụng một số cơ chế để thực hiện các hoạt động bổ sung. Ví dụ: mã bên dưới sẽ in ra "Second, First" vì mặc dù phương thức `setTimeout()` được gọi đầu tiên và trả về ngay lập tức, hoạt động này không hoàn thành trong vài giây.

```js
setTimeout(() => {
  console.log("First");
}, 3000);
console.log("Second");
```

Sử dụng các API bất đồng bộ không chặn thậm chí còn quan trọng hơn trên Node so với trong trình duyệt vì các ứng dụng _Node_ thường được viết như một môi trường thực thi đơn luồng, hướng sự kiện. "Đơn luồng" có nghĩa là tất cả các yêu cầu đến máy chủ đều chạy trên cùng một luồng (thay vì được tạo ra thành các tiến trình riêng biệt). Mô hình này cực kỳ hiệu quả về tốc độ và tài nguyên máy chủ. Tuy nhiên, nó có nghĩa là nếu bất kỳ hàm nào của bạn gọi các phương thức đồng bộ mất nhiều thời gian để hoàn thành, chúng sẽ chặn không chỉ yêu cầu hiện tại mà còn mọi yêu cầu khác đang được xử lý bởi ứng dụng web của bạn.

Có nhiều cách để API bất đồng bộ thông báo cho ứng dụng của bạn rằng nó đã hoàn thành. Về mặt lịch sử, cách tiếp cận được sử dụng là đăng ký hàm gọi lại khi gọi API bất đồng bộ, sau đó được gọi khi hoạt động hoàn thành (đây là cách tiếp cận được sử dụng ở trên).

> [!NOTE]
> Sử dụng hàm gọi lại có thể khá "lộn xộn" nếu bạn có một chuỗi các hoạt động bất đồng bộ phụ thuộc phải được thực hiện theo thứ tự, vì điều này dẫn đến nhiều cấp độ hàm gọi lại lồng nhau. Vấn đề này thường được gọi là "callback hell".

> [!NOTE]
> Một quy ước phổ biến cho Node và Express là sử dụng hàm gọi lại lỗi-đầu tiên. Trong quy ước này, giá trị đầu tiên trong các _hàm gọi lại_ của bạn là giá trị lỗi, trong khi các đối số tiếp theo chứa dữ liệu thành công. Có một giải thích tốt về tại sao cách tiếp cận này hữu ích trong blog này: [The Node.js Way - Understanding Error-First Callbacks](https://fredkschott.com/post/2014/03/understanding-error-first-callbacks-in-node-js/) (fredkschott.com).

Mã JavaScript hiện đại thường xuyên sử dụng [Promises](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Promise) và [async/await](/en-US/docs/Web/JavaScript/Reference/Statements/async_function) để quản lý luồng chương trình bất đồng bộ.
Bạn nên sử dụng promises khi có thể. Nếu làm việc với mã sử dụng hàm gọi lại, bạn có thể sử dụng hàm [`utils.promisify`](https://nodejs.org/api/util.html#utilpromisifyoriginal) của Node.js để xử lý việc chuyển đổi hàm gọi lại → Promise một cách thuận tiện.

### Tạo trình xử lý route

Trong ví dụ _Hello World_ Express của chúng tôi (xem ở trên), chúng tôi đã định nghĩa một hàm trình xử lý route (hàm gọi lại) cho các yêu cầu HTTP `GET` đến gốc trang web (`'/'`).

```js
app.get("/", (req, res) => {
  res.send("Hello World!");
});
```

Hàm gọi lại lấy đối tượng yêu cầu và phản hồi làm đối số. Trong trường hợp này, phương thức gọi [`send()`](https://expressjs.com/en/5x/api.html#res.send) trên phản hồi để trả về chuỗi "Hello World!" Có một [số phương thức phản hồi khác](https://expressjs.com/en/guide/routing.html#response-methods) để kết thúc chu kỳ yêu cầu/phản hồi, ví dụ: bạn có thể gọi [`res.json()`](https://expressjs.com/en/5x/api.html#res.json) để gửi phản hồi JSON hoặc [`res.sendFile()`](https://expressjs.com/en/5x/api.html#res.sendFile) để gửi một tệp.

> [!NOTE]
> Bạn có thể sử dụng bất kỳ tên đối số nào bạn thích trong các hàm gọi lại; khi hàm gọi lại được gọi, đối số đầu tiên sẽ luôn là yêu cầu và đối số thứ hai sẽ luôn là phản hồi. Có ý nghĩa khi đặt tên chúng sao cho bạn có thể xác định đối tượng bạn đang làm việc trong phần thân của hàm gọi lại.

Đối tượng _ứng dụng Express_ cũng cung cấp các phương thức để định nghĩa các trình xử lý route cho tất cả các phương thức HTTP khác, hầu hết được sử dụng theo cách hoàn toàn giống nhau:

`checkout()`, `copy()`, **`delete()`**, **`get()`**, `head()`, `lock()`, `merge()`, `mkactivity()`, `mkcol()`, `move()`, `m-search()`, `notify()`, `options()`, `patch()`, **`post()`**, `purge()`, **`put()`**, `report()`, `search()`, `subscribe()`, `trace()`, `unlock()`, `unsubscribe()`.

Có một phương thức định tuyến đặc biệt, `app.all()`, sẽ được gọi để đáp lại bất kỳ phương thức HTTP nào. Điều này được sử dụng để tải các hàm middleware tại một đường dẫn cụ thể cho tất cả các phương thức yêu cầu. Ví dụ sau (từ tài liệu Express) hiển thị một trình xử lý sẽ được thực thi cho các yêu cầu đến `/secret` bất kể phương thức HTTP nào được sử dụng (miễn là nó được hỗ trợ bởi [module http](https://nodejs.org/docs/latest/api/http.html#httpmethods)).

```js
app.all("/secret", (req, res, next) => {
  console.log("Accessing the secret section…");
  next(); // pass control to the next handler
});
```

Route cho phép bạn khớp các mẫu ký tự cụ thể trong URL và trích xuất một số giá trị từ URL và truyền chúng dưới dạng tham số cho trình xử lý route (như các thuộc tính của đối tượng yêu cầu được truyền dưới dạng tham số).

Thường hữu ích khi nhóm các trình xử lý route cho một phần cụ thể của trang web lại với nhau và truy cập chúng bằng cách sử dụng tiền tố route chung (ví dụ: một trang web có Wiki có thể có tất cả các route liên quan đến wiki trong một tệp và có chúng được truy cập với tiền tố route _/wiki/_). Trong _Express_ điều này được thực hiện bằng cách sử dụng đối tượng [`express.Router`](https://expressjs.com/en/guide/routing.html#express-router). Ví dụ: chúng tôi có thể tạo route wiki của mình trong một module có tên **wiki.js** và sau đó export đối tượng `Router`, như được hiển thị bên dưới:

```js
// wiki.js - Wiki route module

const express = require("express");

const router = express.Router();

// Home page route
router.get("/", (req, res) => {
  res.send("Wiki home page");
});

// About page route
router.get("/about", (req, res) => {
  res.send("About this wiki");
});

module.exports = router;
```

> [!NOTE]
> Thêm route vào đối tượng `Router` giống hệt như thêm route vào đối tượng `app` (như được hiển thị trước đó).

Để sử dụng bộ định tuyến trong tệp ứng dụng chính của chúng tôi, chúng tôi sẽ `require()` module route (**wiki.js**) và sau đó gọi `use()` trên ứng dụng _Express_ để thêm Bộ định tuyến vào đường dẫn xử lý middleware. Hai route sau đó sẽ có thể truy cập từ `/wiki/` và `/wiki/about/`.

```js
const wiki = require("./wiki.js");

// …
app.use("/wiki", wiki);
```

Chúng tôi sẽ chỉ cho bạn nhiều hơn về làm việc với route, và đặc biệt là về việc sử dụng `Router`, sau này trong phần được liên kết [Route và bộ điều khiển](/en-US/docs/Learn_web_development/Extensions/Server-side/Express_Nodejs/routes).

### Sử dụng middleware

Middleware được sử dụng rộng rãi trong các ứng dụng Express, cho các tác vụ từ phục vụ các tệp tĩnh đến xử lý lỗi, đến nén các phản hồi HTTP. Trong khi các hàm route kết thúc chu kỳ yêu cầu-phản hồi HTTP bằng cách trả về một số phản hồi cho máy khách HTTP, các hàm middleware _thường_ thực hiện một số hoạt động trên yêu cầu hoặc phản hồi và sau đó gọi hàm tiếp theo trong "ngăn xếp", có thể là nhiều middleware hơn hoặc một trình xử lý route. Thứ tự gọi middleware là tùy thuộc vào nhà phát triển ứng dụng.

> [!NOTE]
> Middleware có thể thực hiện bất kỳ hoạt động nào, thực thi bất kỳ mã nào, thực hiện các thay đổi đối với đối tượng yêu cầu và phản hồi, và nó _cũng có thể kết thúc chu kỳ yêu cầu-phản hồi_. Nếu nó không kết thúc chu kỳ thì nó phải gọi `next()` để chuyển quyền kiểm soát cho hàm middleware tiếp theo (hoặc yêu cầu sẽ bị treo).

Hầu hết các ứng dụng sẽ sử dụng middleware _bên thứ ba_ để đơn giản hóa các tác vụ phát triển web phổ biến như làm việc với cookie, phiên, xác thực người dùng, truy cập dữ liệu `POST` và JSON của yêu cầu, logging, v.v. Bạn có thể tìm thấy [danh sách các gói middleware được duy trì bởi nhóm Express](https://expressjs.com/en/resources/middleware.html) (cũng bao gồm các gói bên thứ ba phổ biến khác). Các gói Express khác có sẵn trên trình quản lý gói npm.

Để sử dụng middleware bên thứ ba, trước tiên bạn cần cài đặt nó vào ứng dụng của mình bằng npm.
Ví dụ: để cài đặt middleware logger HTTP request [morgan](https://expressjs.com/en/resources/middleware/morgan.html), bạn sẽ làm điều này:

```bash
npm install morgan
```

Sau đó bạn có thể gọi `use()` trên _đối tượng ứng dụng Express_ để thêm middleware vào ngăn xếp:

```js
const express = require("express");
const logger = require("morgan");

const app = express();
app.use(logger("dev"));
// …
```

> [!NOTE]
> Middleware và các hàm định tuyến được gọi theo thứ tự chúng được khai báo. Đối với một số middleware, thứ tự là quan trọng (ví dụ: nếu session middleware phụ thuộc vào cookie middleware, thì cookie handler phải được thêm đầu tiên). Hầu như luôn là trường hợp middleware được gọi trước khi thiết lập các route, hoặc các trình xử lý route của bạn sẽ không có quyền truy cập vào chức năng được thêm bởi middleware của bạn.

Bạn có thể viết các hàm middleware của riêng mình và bạn có khả năng phải làm vậy (ít nhất là để tạo mã xử lý lỗi). Sự **khác biệt duy nhất** giữa hàm middleware và hàm gọi lại trình xử lý route là các hàm middleware có đối số thứ ba `next`, mà các hàm middleware được mong đợi gọi nếu chúng không phải là thứ hoàn thành chu kỳ yêu cầu (khi hàm middleware được gọi, điều này chứa hàm _next_ phải được gọi).

Bạn có thể thêm hàm middleware vào chuỗi xử lý cho _tất cả các phản hồi_ với `app.use()`, hoặc cho một phương thức HTTP cụ thể bằng cách sử dụng phương thức liên quan: `app.get()`, `app.post()`, v.v. Route được chỉ định theo cùng một cách cho cả hai trường hợp, mặc dù route là tùy chọn khi gọi `app.use()`.

Ví dụ dưới đây hiển thị cách bạn có thể thêm hàm middleware bằng cả hai phương pháp, và có/không có route.

```js
const express = require("express");

const app = express();

// An example middleware function
function middlewareFunction(req, res, next) {
  // Perform some operations
  next(); // Call next() so Express will call the next middleware function in the chain.
}

// Function added with use() for all routes and verbs
app.use(middlewareFunction);

// Function added with use() for a specific route
app.use("/some-route", middlewareFunction);

// A middleware function added for a specific HTTP verb and route
app.get("/", middlewareFunction);

app.listen(3000);
```

> [!NOTE]
> Ở trên chúng tôi khai báo hàm middleware riêng biệt và sau đó đặt nó làm hàm gọi lại. Trong hàm trình xử lý route trước đó của chúng tôi, chúng tôi đã khai báo hàm gọi lại khi nó được sử dụng. Trong JavaScript, cả hai cách tiếp cận đều hợp lệ.

Tài liệu Express có rất nhiều tài liệu tuyệt vời về [sử dụng](https://expressjs.com/en/guide/using-middleware.html) và [viết](https://expressjs.com/en/guide/writing-middleware.html) Express middleware.

### Phục vụ các tệp tĩnh

Bạn có thể sử dụng middleware [express.static](https://expressjs.com/en/5x/api.html#express.static) để phục vụ các tệp tĩnh, bao gồm hình ảnh, CSS và JavaScript (`static()` là hàm middleware duy nhất thực sự **là một phần** của _Express_). Ví dụ: bạn sẽ sử dụng dòng bên dưới để phục vụ hình ảnh, tệp CSS và tệp JavaScript từ thư mục có tên '**public'** ở cùng cấp với nơi bạn gọi node:

```js
app.use(express.static("public"));
```

Bất kỳ tệp nào trong thư mục public đều được phục vụ bằng cách thêm tên tệp của chúng (_tương đối_ so với thư mục "public" cơ sở) vào URL cơ sở. Ví dụ:

```plain
http://localhost:3000/images/dog.jpg
http://localhost:3000/css/style.css
http://localhost:3000/js/app.js
http://localhost:3000/about.html
```

Bạn có thể gọi `static()` nhiều lần để phục vụ nhiều thư mục. Nếu một tệp không thể tìm thấy bởi một hàm middleware thì nó sẽ được chuyển đến middleware tiếp theo (thứ tự gọi middleware dựa trên thứ tự khai báo của bạn).

```js
app.use(express.static("public"));
app.use(express.static("media"));
```

Bạn cũng có thể tạo tiền tố ảo cho các URL tĩnh của mình, thay vì các tệp được thêm vào URL cơ sở. Ví dụ: ở đây chúng tôi [chỉ định đường dẫn mount](https://expressjs.com/en/5x/api.html#app.use) sao cho các tệp được tải với tiền tố "/media":

```js
app.use("/media", express.static("public"));
```

Bây giờ bạn có thể tải các tệp trong thư mục `public` từ tiền tố đường dẫn `/media`.

```plain
http://localhost:3000/media/images/dog.jpg
http://localhost:3000/media/video/cat.mp4
http://localhost:3000/media/cry.mp3
```

> [!NOTE]
> Xem thêm [Phục vụ tệp tĩnh trong Express](https://expressjs.com/en/starter/static-files.html).

### Xử lý lỗi

Lỗi được xử lý bởi một hoặc nhiều hàm middleware đặc biệt có bốn đối số, thay vì ba thông thường: `(err, req, res, next)`. Ví dụ:

```js
app.use((err, req, res, next) => {
  console.error(err.stack);
  res.status(500).send("Something broke!");
});
```

Chúng có thể trả về bất kỳ nội dung nào được yêu cầu, nhưng phải được gọi sau tất cả các lệnh gọi `app.use()` và route khác để chúng là middleware cuối cùng trong quá trình xử lý yêu cầu!

Express đi kèm với trình xử lý lỗi tích hợp, xử lý bất kỳ lỗi còn lại nào có thể gặp trong ứng dụng. Hàm middleware xử lý lỗi mặc định này được thêm vào cuối ngăn xếp hàm middleware. Nếu bạn chuyển lỗi đến `next()` và bạn không xử lý nó trong một trình xử lý lỗi, nó sẽ được xử lý bởi trình xử lý lỗi tích hợp; lỗi sẽ được ghi vào máy khách với stack trace.

> [!NOTE]
> Stack trace không được bao gồm trong môi trường sản xuất. Để chạy nó ở chế độ sản xuất, bạn cần đặt biến môi trường `NODE_ENV` thành `"production"`.

> [!NOTE]
> HTTP404 và các mã trạng thái "lỗi" khác không được coi là lỗi. Nếu bạn muốn xử lý những điều này, bạn có thể thêm hàm middleware để làm vậy. Để biết thêm thông tin xem [FAQ](https://expressjs.com/en/starter/faq.html#how-do-i-handle-404-responses).

Để biết thêm thông tin xem [Xử lý lỗi](https://expressjs.com/en/guide/error-handling.html) (Tài liệu Express).

### Sử dụng cơ sở dữ liệu

Các ứng dụng _Express_ có thể sử dụng bất kỳ cơ chế cơ sở dữ liệu nào được _Node_ hỗ trợ (_Express_ bản thân không định nghĩa bất kỳ hành vi/yêu cầu bổ sung cụ thể nào cho quản lý cơ sở dữ liệu). Có nhiều tùy chọn, bao gồm PostgreSQL, MySQL, Redis, SQLite, MongoDB, v.v.

Để sử dụng những thứ này, bạn phải cài đặt trình điều khiển cơ sở dữ liệu trước bằng npm. Ví dụ: để cài đặt trình điều khiển cho MongoDB NoSQL phổ biến, bạn sẽ sử dụng lệnh:

```bash
npm install mongodb
```

Bản thân cơ sở dữ liệu có thể được cài đặt cục bộ hoặc trên máy chủ đám mây. Trong mã Express của bạn, bạn import trình điều khiển, kết nối với cơ sở dữ liệu và sau đó thực hiện các hoạt động tạo, đọc, cập nhật và xóa (CRUD).
Ví dụ dưới đây hiển thị cách bạn có thể tìm các bản ghi "mammal" bằng MongoDB:

```js
const { MongoClient } = require("mongodb");

const uri = "mongodb://localhost:27017";
const client = new MongoClient(uri);

async function run() {
  try {
    await client.connect();
    const db = client.db("animals");
    const mammals = await db.collection("mammals").find().toArray();
    console.log(mammals);
  } finally {
    await client.close();
  }
}

run().catch(console.error);
```

Một cách tiếp cận phổ biến khác là truy cập cơ sở dữ liệu của bạn gián tiếp, qua Object Relational Mapper ("ORM"). Trong cách tiếp cận này, bạn định nghĩa dữ liệu của mình là "đối tượng" hoặc "mô hình" và ORM ánh xạ chúng vào định dạng cơ sở dữ liệu cơ bản. Cách tiếp cận này có lợi là với tư cách là nhà phát triển, bạn có thể tiếp tục suy nghĩ theo các đối tượng JavaScript thay vì ngữ nghĩa cơ sở dữ liệu và có một nơi rõ ràng để thực hiện xác thực và kiểm tra dữ liệu đến. Chúng tôi sẽ nói thêm về cơ sở dữ liệu trong một bài viết sau.

Để biết thêm thông tin xem [Tích hợp cơ sở dữ liệu](https://expressjs.com/en/guide/database-integration.html) (Tài liệu Express).

### Render dữ liệu (views)

Các công cụ mẫu (cũng được gọi là "công cụ view" trong _Express_) cho phép bạn chỉ định _cấu trúc_ của tài liệu đầu ra trong một mẫu, sử dụng các vị trí giữ chỗ cho dữ liệu sẽ được điền vào khi một trang được tạo. Mẫu thường được sử dụng để tạo HTML, nhưng cũng có thể tạo các loại tài liệu khác.

Express hỗ trợ một số công cụ mẫu, đáng chú ý là Pug (trước đây là "Jade"), Mustache và EJS. Mỗi cái có điểm mạnh riêng để giải quyết các trường hợp sử dụng cụ thể (có thể dễ dàng tìm thấy so sánh tương đối qua tìm kiếm Internet).
Trình tạo ứng dụng Express sử dụng Jade làm mặc định, nhưng nó cũng hỗ trợ một số cái khác.

Trong mã cài đặt ứng dụng của bạn, bạn đặt công cụ mẫu để sử dụng và vị trí Express nên tìm mẫu bằng cách sử dụng cài đặt 'views' và 'view engine', như được hiển thị bên dưới (bạn cũng sẽ phải cài đặt gói chứa thư viện mẫu của bạn!)

```js
const express = require("express");
const path = require("path");

const app = express();

// Set directory to contain the templates ('views')
app.set("views", path.join(__dirname, "views"));

// Set view engine to use, in this case 'some_template_engine_name'
app.set("view engine", "some_template_engine_name");
```

Giao diện của mẫu sẽ phụ thuộc vào công cụ bạn sử dụng. Giả sử bạn có một tệp mẫu có tên "index.\<template_extension>" chứa các vị trí giữ chỗ cho các biến dữ liệu có tên 'title' và "message", bạn sẽ gọi [`Response.render()`](https://expressjs.com/en/5x/api.html#res.render) trong một hàm trình xử lý route để tạo và gửi phản hồi HTML:

```js
app.get("/", (req, res) => {
  res.render("index", { title: "About dogs", message: "Dogs rock!" });
});
```

Để biết thêm thông tin xem [Sử dụng công cụ mẫu với Express](https://expressjs.com/en/guide/using-template-engines.html) (Tài liệu Express).

### Cấu trúc tệp

Express không đưa ra bất kỳ giả định nào về cấu trúc hay các thành phần bạn sử dụng. Route, views, tệp tĩnh và các logic ứng dụng cụ thể khác có thể sống trong bất kỳ số lượng tệp nào với bất kỳ cấu trúc thư mục nào. Mặc dù hoàn toàn có thể có toàn bộ ứng dụng _Express_ trong một tệp, thường có ý nghĩa khi chia ứng dụng của bạn thành các tệp dựa trên chức năng (ví dụ: quản lý tài khoản, blog, bảng thảo luận) và lĩnh vực kiến trúc (ví dụ: mô hình, view hoặc bộ điều khiển nếu bạn đang sử dụng [kiến trúc MVC](/en-US/docs/Glossary/MVC)).

Trong một chủ đề sau, chúng tôi sẽ sử dụng _Trình tạo ứng dụng Express_, tạo ra một khung ứng dụng mô-đun mà chúng tôi có thể dễ dàng mở rộng để tạo các ứng dụng web.

## Tóm tắt

Xin chúc mừng, bạn đã hoàn thành bước đầu tiên trong hành trình Express/Node của mình! Bây giờ bạn nên hiểu những lợi ích chính của Express và Node, và đại khái những phần chính của ứng dụng Express có thể trông như thế nào (route, middleware, xử lý lỗi và mã mẫu). Bạn cũng nên hiểu rằng với Express là một framework không áp đặt quan điểm, cách bạn ghép các phần này lại với nhau và các thư viện bạn sử dụng phần lớn tùy thuộc vào bạn!

Tất nhiên Express được thiết kế cố ý là một framework ứng dụng web rất nhẹ, vì vậy phần lớn lợi ích và tiềm năng của nó đến từ các thư viện và tính năng bên thứ ba. Chúng tôi sẽ xem xét những thứ đó chi tiết hơn trong các bài viết sau. Trong bài viết tiếp theo, chúng tôi sẽ xem xét thiết lập môi trường phát triển Node, để bạn có thể bắt đầu xem một số mã Express hoạt động.

## Xem thêm

- [Learn Node.js](https://scrimba.com/learn-nodejs-c00ho9qqh6?via=mdn) từ Scrimba <sup>[_Đối tác học tập MDN_](/en-US/docs/MDN/Writing_guidelines/Learning_content#partner_links_and_embeds)</sup> cung cấp giới thiệu tương tác và thú vị về Node.js.
- [Learn Express.js](https://scrimba.com/learn-expressjs-c062las154?via=mdn) từ Scrimba <sup>[_Đối tác học tập MDN_](/en-US/docs/MDN/Writing_guidelines/Learning_content#partner_links_and_embeds)</sup> xây dựng dựa trên liên kết trước đó, hiển thị cách bắt đầu sử dụng framework Express để xây dựng các trang web phía máy chủ.
- [Modules](https://nodejs.org/api/modules.html#modules_modules) (Tài liệu API Node)
- [Express](https://expressjs.com/) (trang chủ)
- [Định tuyến cơ bản](https://expressjs.com/en/starter/basic-routing.html) (Tài liệu Express)
- [Hướng dẫn định tuyến](https://expressjs.com/en/guide/routing.html) (Tài liệu Express)
- [Sử dụng công cụ mẫu với Express](https://expressjs.com/en/guide/using-template-engines.html) (Tài liệu Express)
- [Sử dụng middleware](https://expressjs.com/en/guide/using-middleware.html) (Tài liệu Express)
- [Viết middleware để sử dụng trong ứng dụng Express](https://expressjs.com/en/guide/writing-middleware.html) (Tài liệu Express)
- [Tích hợp cơ sở dữ liệu](https://expressjs.com/en/guide/database-integration.html) (Tài liệu Express)
- [Phục vụ tệp tĩnh trong Express](https://expressjs.com/en/starter/static-files.html) (Tài liệu Express)
- [Xử lý lỗi](https://expressjs.com/en/guide/error-handling.html) (Tài liệu Express)

{{NextMenu("Learn_web_development/Extensions/Server-side/Express_Nodejs/development_environment", "Learn_web_development/Extensions/Server-side/Express_Nodejs")}}
