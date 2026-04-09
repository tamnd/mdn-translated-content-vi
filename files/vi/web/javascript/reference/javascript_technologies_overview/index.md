---
title: JavaScript technologies overview
slug: Web/JavaScript/Reference/JavaScript_technologies_overview
page-type: guide
sidebar: jssidebar
---

Trong khi [HTML](/en-US/docs/Web/HTML) định nghĩa cấu trúc và nội dung của một trang web, và [CSS](/en-US/docs/Web/CSS) thiết lập định dạng và giao diện, thì [JavaScript](/en-US/docs/Web/JavaScript) bổ sung tính tương tác cho trang web và tạo ra các ứng dụng web phong phú.

Tuy nhiên, thuật ngữ chung "JavaScript" như được hiểu trong ngữ cảnh trình duyệt web bao gồm một số yếu tố rất khác nhau. Một trong số đó là ngôn ngữ lõi (ECMAScript), một phần khác là tập hợp các [Web API](/en-US/docs/Web/API), bao gồm DOM (Document Object Model).

## JavaScript, ngôn ngữ lõi (ECMAScript)

Ngôn ngữ lõi của JavaScript được chuẩn hóa bởi ủy ban ECMA TC39 với tên gọi ECMAScript. "ECMAScript" là thuật ngữ cho tiêu chuẩn ngôn ngữ, nhưng "ECMAScript" và "JavaScript" có thể được sử dụng thay thế cho nhau.

Ngôn ngữ lõi này cũng được sử dụng trong các môi trường không phải trình duyệt, ví dụ như trong [Node.js](https://nodejs.org/).

### ECMAScript bao gồm những gì?

Trong số những thứ khác, ECMAScript định nghĩa:

- Cú pháp ngôn ngữ (quy tắc phân tích cú pháp, từ khóa, luồng điều khiển, khởi tạo object literal, ...)
- Cơ chế xử lý lỗi ({{jsxref("Statements/throw", "throw")}}, {{jsxref("Statements/try...catch", "try...catch")}}, khả năng tạo các kiểu {{jsxref("Error")}} do người dùng định nghĩa)
- Kiểu dữ liệu (boolean, number, string, function, object, ...)
- Cơ chế kế thừa dựa trên prototype
- Các đối tượng và hàm tích hợp sẵn, bao gồm {{jsxref("JSON")}}, {{jsxref("Math")}}, các phương thức [Array](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array), {{jsxref("parseInt")}}, {{jsxref("decodeURI")}}, v.v.
- [Strict mode](/en-US/docs/Web/JavaScript/Reference/Strict_mode)
- Một [hệ thống module](/en-US/docs/Web/JavaScript/Guide/Modules)
- Mô hình bộ nhớ cơ bản

### Quy trình chuẩn hóa

Các phiên bản ECMAScript được ủy ban Đại hội đồng ECMA phê duyệt và xuất bản hàng năm như một tiêu chuẩn. Toàn bộ quá trình phát triển được công khai trên [tổ chức GitHub Ecma TC39](https://github.com/tc39), nơi lưu trữ các đề xuất, văn bản đặc tả chính thức và ghi chú cuộc họp.

Trước phiên bản thứ 6 của ECMAScript (được gọi là ES6), các đặc tả được xuất bản vài năm một lần và thường được gọi theo số phiên bản chính — ES3, ES5, v.v. Sau ES6, đặc tả được đặt tên theo năm xuất bản — ES2017, ES2018, v.v. ES6 đồng nghĩa với ES2015. _ESNext_ là một tên động dùng để chỉ phiên bản tiếp theo tại thời điểm viết. Các tính năng ESNext được gọi chính xác hơn là đề xuất, bởi vì theo định nghĩa, đặc tả chưa được hoàn thiện.

Bản snapshot được ủy ban phê duyệt hiện tại của ECMA-262 có sẵn ở định dạng PDF và HTML trên [trang đặc tả ngôn ngữ ECMA-262](https://ecma-international.org/publications-and-standards/standards/ecma-262/) của Ecma International. ECMA-262 và ECMA-402 được duy trì liên tục và cập nhật bởi các biên tập viên đặc tả; website TC39 lưu trữ các phiên bản mới nhất, cập nhật nhất của [ECMA-262](https://tc39.es/ecma262/) và [ECMA-402](https://tc39.es/ecma402/).

Các tính năng ngôn ngữ mới, bao gồm việc giới thiệu cú pháp và API mới cũng như sửa đổi các hành vi hiện có, được thảo luận dưới dạng đề xuất. Mỗi đề xuất trải qua một [quy trình 4 giai đoạn](https://tc39.es/process-document/), và thường được các JavaScript engine triển khai ở giai đoạn 3 hoặc 4, từ đó có thể sử dụng rộng rãi.

Xem thêm [mục ECMAScript trên Wikipedia](https://en.wikipedia.org/wiki/ECMAScript) để biết thêm thông tin về lịch sử ECMAScript.

### API Quốc tế hóa

[Đặc tả API Quốc tế hóa ECMAScript](https://402.ecma-international.org/1.0/) là phần bổ sung cho Đặc tả Ngôn ngữ ECMAScript, cũng được chuẩn hóa bởi Ecma TC39. API quốc tế hóa cung cấp đối chiếu (so sánh string), định dạng số, và định dạng ngày giờ cho các ứng dụng JavaScript, cho phép ứng dụng chọn ngôn ngữ và điều chỉnh chức năng theo nhu cầu của mình. Tiêu chuẩn ban đầu được phê duyệt vào tháng 12 năm 2012; trạng thái triển khai trong trình duyệt được theo dõi trong tài liệu của đối tượng {{jsxref("Intl")}}. Đặc tả Quốc tế hóa hiện nay cũng được phê chuẩn hàng năm và trình duyệt liên tục cải thiện việc triển khai của mình.

### Tài nguyên liên quan

Có nhiều cách để bạn có thể tham gia hoặc theo dõi công việc hiện tại về Đặc tả Ngôn ngữ ECMAScript và Đặc tả API Quốc tế hóa ECMAScript cùng các tài nguyên liên quan:

- [Repo Đặc tả Ngôn ngữ ECMAScript](https://github.com/tc39/ecma262)
- [Repo Đặc tả API Quốc tế hóa ECMAScript](https://github.com/tc39/ecma402)
- [Repo đề xuất ECMAScript](https://github.com/tc39/proposals)
- [Repo bộ kiểm tra tuân thủ ECMAScript](https://github.com/tc39/test262)
- [Ghi chú cuộc họp TC39](https://github.com/tc39/notes)
- [Thảo luận đặc tả ECMAScript; danh sách gửi thư hiện tại](https://es.discourse.group/)
- [Thảo luận đặc tả ECMAScript; kho lưu trữ danh sách gửi thư lịch sử (đến tháng 3 năm 2021)](https://esdiscuss.org/)

## DOM API

### WebIDL

[Đặc tả WebIDL](https://webidl.spec.whatwg.org/) cung cấp liên kết giữa các công nghệ DOM và ECMAScript.

### Lõi của DOM

Document Object Model (DOM) là một quy ước **độc lập ngôn ngữ**, đa nền tảng để biểu diễn và tương tác với các đối tượng trong tài liệu HTML, XHTML và XML. Các đối tượng trong **cây DOM** có thể được truy cập và thao tác bằng cách sử dụng các phương thức trên các đối tượng đó. Hiện nay, đặc tả [DOM core](https://dom.spec.whatwg.org/) được duy trì bởi [WHATWG](/en-US/docs/Glossary/WHATWG) (thay thế phiên bản [W3C](/en-US/docs/Glossary/W3C)). Nó định nghĩa các interface không phụ thuộc ngôn ngữ để trừu tượng hóa tài liệu HTML và XML thành các đối tượng, đồng thời định nghĩa các cơ chế để thao tác với sự trừu tượng hóa này. Bao gồm: {{domxref("Node")}}, {{domxref("Element")}}, {{domxref("DocumentFragment")}}, {{domxref("Document")}}, {{domxref("DOMImplementation")}}, {{domxref("Event")}}, {{domxref("EventTarget")}}, và nhiều hơn nữa.

Từ góc độ ECMAScript, các đối tượng được định nghĩa trong đặc tả DOM được gọi là "host objects".

### HTML DOM

[HTML](https://html.spec.whatwg.org/multipage/), ngôn ngữ đánh dấu của Web, được đặc tả theo cách dựa trên DOM. Được xây dựng trên các khái niệm trừu tượng được định nghĩa trong DOM Core, HTML cũng định nghĩa _ý nghĩa_ của các phần tử. HTML DOM bao gồm các thứ như thuộc tính `className` trên các phần tử HTML, hoặc các API như {{domxref("Document.body")}}.

Đặc tả HTML cũng định nghĩa các hạn chế đối với tài liệu; ví dụ, nó yêu cầu tất cả các phần tử con của phần tử {{htmlelement("ul")}}, đại diện cho danh sách không có thứ tự, phải là các phần tử {{htmlelement("li")}}, vì chúng đại diện cho các mục danh sách. Nhìn chung, nó cũng cấm sử dụng các phần tử và thuộc tính không được định nghĩa trong một tiêu chuẩn.

Tìm kiếm đối tượng {{domxref("Document")}}, đối tượng {{domxref("Window")}}, và các phần tử DOM khác? Đọc [tài liệu DOM](/en-US/docs/Web/API/Document_Object_Model).

## Các API đáng chú ý khác

- Các hàm {{domxref("Window.setTimeout", "setTimeout()")}} và {{domxref("Window.setInterval", "setInterval()")}} lần đầu tiên được đặc tả trên interface {{domxref("Window")}} trong HTML Standard.
- [XMLHttpRequest](https://xhr.spec.whatwg.org/) giúp có thể gửi các yêu cầu HTTP bất đồng bộ.
- [Fetch API](https://fetch.spec.whatwg.org/) cung cấp một lớp trừu tượng tiện lợi hơn cho các yêu cầu mạng.
- [CSS Object Model](https://drafts.csswg.org/cssom/) trừu tượng hóa các quy tắc CSS thành đối tượng.
- [WebWorkers](https://html.spec.whatwg.org/multipage/workers.html) cho phép tính toán song song.
- [WebSockets](https://html.spec.whatwg.org/multipage/#network) cho phép giao tiếp hai chiều ở mức thấp.
- [Canvas 2D Context](https://html.spec.whatwg.org/multipage//#2dcontext) là một API vẽ cho [`<canvas>`](/en-US/docs/Web/HTML/Reference/Elements/canvas).
- [WebAssembly interface](https://webassembly.github.io/spec/js-api/) cung cấp các tiện ích để giao tiếp giữa code JavaScript và các module [WebAssembly](/en-US/docs/WebAssembly).

Các môi trường không phải trình duyệt (như Node.js) thường không có DOM API — vì chúng không tương tác với tài liệu — nhưng chúng thường vẫn triển khai nhiều Web API, chẳng hạn như {{domxref("Window.fetch", "fetch()")}} và {{domxref("Window.setTimeout", "setTimeout()")}}.

## Các triển khai JavaScript

Các JavaScript engine được sử dụng trong các trình duyệt web hiện tại bao gồm:

- [SpiderMonkey](https://spidermonkey.dev/) của Mozilla, được sử dụng trong Firefox, Servo và Flow. Các sử dụng ngoài trình duyệt khác bao gồm MongoDB, CouchDB, và nhiều hơn nữa. Đây là JavaScript engine _đầu tiên từ trước đến nay_, được tạo ra bởi Brendan Eich tại Netscape.
- [V8](https://v8.dev/) của Google, được sử dụng trong Chrome và các trình duyệt dựa trên Chromium như Opera, Edge và Brave. Các sử dụng ngoài trình duyệt khác bao gồm [Node.js](https://nodejs.org/), [Deno](https://deno.com/), [Electron](https://www.electronjs.org/), và nhiều hơn nữa.
- [JavaScriptCore](https://docs.webkit.org/Deep%20Dive/JSC/JavaScriptCore.html) của Apple (còn được gọi là SquirrelFish/Nitro), được sử dụng trong Safari và các trình duyệt dựa trên WebKit khác. Các sử dụng ngoài trình duyệt khác bao gồm [Bun](https://bun.com/).
- [LibJS](https://serenityos.github.io/libjs-website/), được sử dụng trong [Ladybird](https://ladybird.org/).

Một số JavaScript engine được sử dụng trong các trình duyệt cũ bao gồm:

- [Carakan](<https://en.wikipedia.org/wiki/Presto_(browser_engine)#ECMAScript_engines>), được sử dụng trong Opera trước khi nó trở thành trình duyệt dựa trên Chromium.
- [Chakra](<https://en.wikipedia.org/wiki/Chakra_(JScript_engine)>) của Microsoft, được sử dụng trong Internet Explorer (mặc dù ngôn ngữ mà nó triển khai chính thức được gọi là "JScript" để tránh các vấn đề bản quyền). Các phiên bản trước của Edge sử dụng một JavaScript engine khác, cũng gây nhầm lẫn được gọi là [Chakra](<https://en.wikipedia.org/wiki/Chakra_(JavaScript_engine)>), trước khi nó trở thành trình duyệt dựa trên Chromium.

Một số JavaScript engine được thiết kế đặc biệt cho mục đích ngoài trình duyệt bao gồm:

- [Engine262](https://engine262.js.org/), được viết bằng JavaScript và về cơ bản nhằm mục đích là một triển khai tham chiếu của ngôn ngữ.
- [Hermes](https://github.com/facebook/hermes) của Meta, được tối ưu hóa cho [React Native](https://reactnative.dev/docs/hermes).
- [Rhino](<https://en.wikipedia.org/wiki/Rhino_(JavaScript_engine)>) của Mozilla, được viết bằng Java.
- [GraalJS](https://www.graalvm.org/) của Oracle, được viết bằng Java và xây dựng trên GraalVM.
- [Moddable XS](https://www.moddable.com/), dành cho các hệ thống IoT/nhúng.
- [QuickJS](https://bellard.org/quickjs/), nhằm mục đích nhỏ gọn và nhẹ.

Các JavaScript engine cung cấp một API công khai mà các nhà phát triển ứng dụng có thể sử dụng để tích hợp JavaScript vào phần mềm của họ. Cho đến nay, môi trường host phổ biến nhất của JavaScript là trình duyệt web. Trình duyệt web thường sử dụng API công khai để tạo ra các **host objects** có trách nhiệm phản ánh [DOM](https://dom.spec.whatwg.org/) vào JavaScript.

Một ứng dụng phổ biến khác của JavaScript là ngôn ngữ scripting phía máy chủ (Web). Một máy chủ web JavaScript cung cấp các host object biểu diễn đối tượng yêu cầu và phản hồi HTTP, sau đó có thể được thao tác bởi một chương trình JavaScript để tạo ra trang web động. [Node.js](https://nodejs.org/) là một ví dụ phổ biến về điều này.

## Shell

Một JavaScript shell cho phép bạn nhanh chóng kiểm tra các đoạn code JavaScript mà không cần phải tải lại trang web. Chúng cực kỳ hữu ích cho việc phát triển và gỡ lỗi code.

### Các JavaScript shell độc lập

Các JavaScript shell sau đây là các môi trường độc lập, giống như Perl hoặc Python.

- [Node.js](https://nodejs.org/) - Node.js là một nền tảng để dễ dàng xây dựng các ứng dụng mạng nhanh, có khả năng mở rộng.
- [ShellJS](https://github.com/shelljs/shelljs) - Các lệnh Unix shell di động cho Node.js.

### Các JavaScript shell dựa trên trình duyệt

Các JavaScript shell sau đây chạy code thông qua JavaScript engine của trình duyệt.

- Firefox có một [JavaScript console tích hợp sẵn](https://firefox-source-docs.mozilla.org/devtools-user/web_console/the_command_line_interpreter/index.html), hỗ trợ chỉnh sửa nhiều dòng.
- [Babel REPL](https://babeljs.io/repl) - Một [REPL](https://en.wikipedia.org/wiki/REPL) dựa trên trình duyệt để thử nghiệm JavaScript trong tương lai.
- [TypeScript playground](https://www.typescriptlang.org/play/) — Một sân chơi dựa trên trình duyệt để thử nghiệm cả các tính năng JavaScript mới (thông qua trình biên dịch tsc) và cú pháp TypeScript.

## Công cụ và tài nguyên

Các công cụ hữu ích để viết và gỡ lỗi code JavaScript của bạn.

- [Firefox Developer Tools](https://firefox-source-docs.mozilla.org/devtools-user/index.html)
  - : [Web Console](https://firefox-source-docs.mozilla.org/devtools-user/web_console/index.html), [JavaScript Profiler](https://firefox-source-docs.mozilla.org/devtools-user/performance/index.html), [Debugger](https://firefox-source-docs.mozilla.org/devtools-user/debugger/index.html), và nhiều hơn nữa.
- [Learn JavaScript](https://learnjavascript.online/)
  - : Một tài nguyên xuất sắc cho các nhà phát triển web đầy tham vọng — Học JavaScript trong môi trường tương tác, với các bài học ngắn và bài kiểm tra tương tác, được hướng dẫn bởi đánh giá tự động. 40 bài học đầu tiên miễn phí, và khóa học đầy đủ có sẵn với một khoản thanh toán một lần nhỏ.
- [TogetherJS](https://togetherjs.com/)
  - : Cộng tác trở nên dễ dàng. Bằng cách thêm TogetherJS vào trang web của bạn, người dùng của bạn có thể giúp đỡ lẫn nhau trên một trang web theo thời gian thực!
- [Stack Overflow](https://stackoverflow.com/questions/tagged/javascript)
  - : Các câu hỏi Stack Overflow được gắn thẻ "JavaScript".
- [JSFiddle](https://jsfiddle.net/)
  - : Chỉnh sửa JavaScript, CSS và HTML và nhận kết quả trực tiếp. Sử dụng tài nguyên bên ngoài và cộng tác với nhóm của bạn trực tuyến.
- [Plunker](https://plnkr.co/)
  - : Plunker là một cộng đồng trực tuyến để tạo, cộng tác và chia sẻ các ý tưởng phát triển web của bạn. Chỉnh sửa các tệp JavaScript, CSS và HTML và nhận kết quả trực tiếp cùng cấu trúc tệp.
- [JS Bin](https://jsbin.com/)
  - : JS Bin là một công cụ gỡ lỗi phát triển web cộng tác mã nguồn mở.
- [CodePen](https://codepen.io/)
  - : CodePen là một công cụ phát triển web cộng tác khác được sử dụng như một sân chơi kết quả trực tiếp.
- [StackBlitz](https://stackblitz.com/)
  - : StackBlitz là một sân chơi/công cụ gỡ lỗi trực tuyến khác, có thể lưu trữ và triển khai các ứng dụng full-stack sử dụng React, Angular, v.v.
- [RunJS](https://runjs.app/)
  - : RunJS là một công cụ sân chơi/notepad dành cho máy tính để bàn, cung cấp kết quả trực tiếp và quyền truy cập vào cả API Node và Browser.
