---
title: Thiết lập môi trường phát triển Node
short-title: Dev environment setup
slug: Learn_web_development/Extensions/Server-side/Express_Nodejs/development_environment
page-type: learn-module-chapter
sidebar: learnsidebar
---

{{PreviousMenuNext("Learn_web_development/Extensions/Server-side/Express_Nodejs/Introduction", "Learn_web_development/Extensions/Server-side/Express_Nodejs/Tutorial_local_library_website", "Learn_web_development/Extensions/Server-side/Express_Nodejs")}}

Bây giờ bạn đã biết [Express](/en-US/docs/Learn_web_development/Extensions/Server-side/Express_Nodejs/Introduction#introducing_express) dùng để làm gì, chúng tôi sẽ chỉ cho bạn cách thiết lập và kiểm tra môi trường phát triển Node/Express trên Windows, hoặc Linux (Ubuntu), hoặc macOS. Đối với bất kỳ hệ điều hành phổ biến nào đó, bài viết này cung cấp những gì bạn cần để bắt đầu phát triển ứng dụng Express.

<table>
  <tbody>
    <tr>
      <th scope="row">Điều kiện tiên quyết:</th>
      <td>
        Biết cách mở terminal / dòng lệnh. Biết cách cài đặt các gói phần mềm trên hệ điều hành máy tính phát triển của bạn.
      </td>
    </tr>
    <tr>
      <th scope="row">Mục tiêu:</th>
      <td>Để thiết lập môi trường phát triển cho Express trên máy tính của bạn.</td>
    </tr>
  </tbody>
</table>

## Tổng quan về môi trường phát triển Express

_Node_ và _Express_ giúp việc thiết lập máy tính để bắt đầu phát triển ứng dụng web trở nên rất dễ dàng. Phần này cung cấp tổng quan về các công cụ cần thiết, giải thích một số phương pháp đơn giản nhất để cài đặt Node (và Express) trên Ubuntu, macOS và Windows và hiển thị cách bạn có thể kiểm tra cài đặt của mình.

### Môi trường phát triển Express là gì?

Môi trường phát triển _Express_ bao gồm cài đặt _Nodejs_, _trình quản lý gói npm_ và (tùy chọn) _Trình tạo ứng dụng Express_ trên máy tính cục bộ của bạn.

_Node_ và trình quản lý gói _npm_ được cài đặt cùng nhau từ các gói nhị phân đã chuẩn bị, trình cài đặt, trình quản lý gói hệ điều hành hoặc từ nguồn (như được hiển thị trong các phần sau). _Express_ sau đó được cài đặt bởi npm như một phụ thuộc của các ứng dụng web _Express_ riêng lẻ của bạn (cùng với các thư viện khác như công cụ mẫu, trình điều khiển cơ sở dữ liệu, middleware xác thực, middleware phục vụ tệp tĩnh, v.v.).

_npm_ cũng có thể được sử dụng để (toàn cục) cài đặt _Trình tạo ứng dụng Express_, một công cụ hữu ích để tạo các ứng dụng web _Express_ khung theo [mẫu MVC](/en-US/docs/Glossary/MVC). Trình tạo ứng dụng là tùy chọn vì bạn không _cần_ sử dụng công cụ này để tạo các ứng dụng sử dụng Express, hoặc xây dựng các ứng dụng Express có cùng bố cục kiến trúc hoặc các phụ thuộc. Tuy nhiên, chúng tôi sẽ sử dụng nó vì nó giúp khởi đầu dễ dàng hơn nhiều và thúc đẩy cấu trúc ứng dụng mô-đun.

> [!NOTE]
> Không giống như một số framework web khác, môi trường phát triển không bao gồm một máy chủ web phát triển riêng biệt. Trong _Node_/_Express_, ứng dụng web tự tạo và chạy máy chủ web của nó!

Có các công cụ ngoại vi khác là một phần của môi trường phát triển điển hình, bao gồm [trình soạn thảo văn bản](/en-US/docs/Learn_web_development/Howto/Tools_and_setup/Available_text_editors) hoặc IDE để chỉnh sửa mã và các công cụ quản lý kiểm soát nguồn như [Git](https://git-scm.com/) để quản lý an toàn các phiên bản khác nhau của mã của bạn. Chúng tôi giả định rằng bạn đã cài đặt các loại công cụ này (đặc biệt là một trình soạn thảo văn bản).

### Hệ điều hành nào được hỗ trợ?

_Node_ có thể chạy trên Windows, macOS, nhiều loại Linux, Docker, v.v. Có danh sách đầy đủ trên trang [Downloads](https://nodejs.org/en/download) của Node.js. Hầu hết các máy tính cá nhân nên có hiệu suất cần thiết để chạy Node trong quá trình phát triển. _Express_ chạy trong môi trường _Node_ và do đó có thể chạy trên bất kỳ nền tảng nào chạy _Node_.

Trong bài viết này, chúng tôi cung cấp hướng dẫn thiết lập cho Windows, macOS và Ubuntu Linux.

### Bạn nên sử dụng phiên bản Node/Express nào?

Có nhiều [bản phát hành Node](https://nodejs.org/en/blog/release/) — các bản phát hành mới hơn chứa các bản sửa lỗi, hỗ trợ cho các phiên bản mới hơn của tiêu chuẩn ECMAScript (JavaScript) và cải tiến API Node.

Nói chung, bạn nên sử dụng bản phát hành _LTS (long-term supported)_ gần đây nhất vì nó sẽ ổn định hơn so với bản phát hành "hiện tại" trong khi vẫn có các tính năng tương đối gần đây (và vẫn đang được duy trì tích cực). Bạn nên sử dụng bản phát hành _Current_ nếu bạn cần một tính năng không có trong phiên bản LTS.

Đối với _Express_, bạn nên sử dụng bản phát hành LTS gần đây nhất của Node.

### Còn cơ sở dữ liệu và các phụ thuộc khác thì sao?

Các phụ thuộc khác, như trình điều khiển cơ sở dữ liệu, công cụ mẫu, công cụ xác thực, v.v. là một phần của ứng dụng và được import vào môi trường ứng dụng bằng trình quản lý gói npm. Chúng tôi sẽ thảo luận về chúng trong các bài viết ứng dụng cụ thể sau này.

## Cài đặt Node

Để sử dụng _Express_, bạn sẽ phải cài đặt _Nodejs_ và [Node Package Manager (npm)](https://docs.npmjs.com/) trên hệ điều hành của bạn.
Để giúp điều này dễ dàng hơn, chúng tôi sẽ cài đặt trình quản lý phiên bản node trước, sau đó chúng tôi sẽ sử dụng nó để cài đặt các phiên bản Long Term Supported (LTS) mới nhất của node và npm.

> [!NOTE]
> Bạn cũng có thể cài đặt nodejs và npm với các trình cài đặt cung cấp tại <https://nodejs.org/en/> (chọn nút để tải xuống bản LTS được "Khuyến nghị cho hầu hết người dùng"), hoặc bạn có thể [cài đặt bằng trình quản lý gói cho hệ điều hành của bạn](https://nodejs.org/en/download) (nodejs.org).
> Chúng tôi khuyến khích mạnh mẽ sử dụng trình quản lý phiên bản node vì chúng giúp cài đặt, nâng cấp và chuyển đổi giữa bất kỳ phiên bản cụ thể nào của node và npm dễ dàng hơn.

### Windows

Có một số trình quản lý phiên bản node cho Windows.
Ở đây chúng tôi sử dụng [nvm-windows](https://github.com/coreybutler/nvm-windows), được đánh giá cao trong cộng đồng nhà phát triển node.

Cài đặt phiên bản mới nhất bằng cách sử dụng trình cài đặt bạn chọn từ trang [nvm-windows/releases](https://github.com/coreybutler/nvm-windows/releases).
Sau khi `nvm-windows` đã cài đặt, mở command prompt (hoặc PowerShell) và nhập lệnh sau để tải xuống phiên bản LTS mới nhất của nodejs và npm:

```bash
nvm install lts
```

Tại thời điểm viết, phiên bản LTS của nodejs là 22.17.0.
Bạn có thể đặt đây là _phiên bản hiện tại_ để sử dụng với lệnh bên dưới:

```bash
nvm use 22.17.0
```

> [!NOTE]
> Nếu bạn nhận được cảnh báo "Access Denied", bạn sẽ cần chạy lệnh này trong dấu nhắc với quyền quản trị.

Sử dụng lệnh `nvm --help` để tìm hiểu các tùy chọn dòng lệnh khác, như liệt kê tất cả các phiên bản node có sẵn và tất cả các phiên bản NVM đã tải xuống.

### Ubuntu và macOS

Có một số trình quản lý phiên bản node cho Ubuntu và macOS.
[nvm](https://github.com/nvm-sh/nvm) là một trong những cái phổ biến hơn và là phiên bản gốc mà `nvm-windows` được dựa trên.
Xem [nvm > Install & Update Script](https://github.com/nvm-sh/nvm#install--update-script) để biết hướng dẫn terminal để cài đặt phiên bản mới nhất của nvm.

Sau khi `nvm` đã cài đặt, mở terminal nhập lệnh sau để tải xuống phiên bản LTS mới nhất của nodejs và npm:

```bash
nvm install --lts
```

Tại thời điểm viết, phiên bản LTS của nodejs là 22.17.0.
Lệnh `nvm list` hiển thị tập hợp các phiên bản đã tải xuống và phiên bản hiện tại.
Bạn có thể đặt một phiên bản cụ thể là _phiên bản hiện tại_ với lệnh bên dưới (giống như đối với `nvm-windows`)

```bash
nvm use 22.17.0
```

Sử dụng lệnh `nvm --help` để tìm hiểu các tùy chọn dòng lệnh khác.
Chúng thường tương tự hoặc giống với những cái được cung cấp bởi `nvm-windows`.

### Kiểm tra cài đặt Nodejs và npm của bạn

Một khi bạn đã đặt `nvm` để sử dụng một phiên bản node cụ thể, bạn có thể kiểm tra cài đặt.
Một cách tốt để thực hiện điều này là sử dụng lệnh "version" trong terminal/command prompt và kiểm tra xem chuỗi phiên bản dự kiến có được trả về hay không:

```bash
> node -v
v22.17.0
```

Trình quản lý gói _Nodejs_ _npm_ cũng nên đã được cài đặt và có thể được kiểm tra theo cách tương tự:

```bash
> npm -v
10.9.2
```

Để có một bài kiểm tra thú vị hơn một chút, hãy tạo một máy chủ "pure node" rất cơ bản in ra "Hello World" trong trình duyệt khi bạn truy cập URL đúng trong trình duyệt của mình:

1. Sao chép văn bản sau vào tệp có tên **hellonode.js**. Điều này sử dụng các tính năng Node thuần túy (không có gì từ Express):

   ```js
   // Load HTTP module
   const http = require("http");

   const hostname = "127.0.0.1";
   const port = 3000;

   // Create HTTP server and listen on port 3000 for requests
   const server = http.createServer((req, res) => {
     // Set the response HTTP header with HTTP status and Content type
     res.statusCode = 200;
     res.setHeader("Content-Type", "text/plain");
     res.end("Hello World\n");
   });

   // Listen for request on port 3000, and as a callback function have the port listened on logged
   server.listen(port, hostname, () => {
     console.log(`Server running at http://${hostname}:${port}/`);
   });
   ```

   Mã này import module "http" và sử dụng nó để tạo một máy chủ (`createServer()`) lắng nghe các yêu cầu HTTP trên cổng 3000. Script sau đó in một thông báo vào console về URL trình duyệt nào bạn có thể sử dụng để kiểm tra máy chủ. Hàm `createServer()` lấy làm đối số một hàm gọi lại sẽ được gọi khi nhận được yêu cầu HTTP — điều này trả về phản hồi với mã trạng thái HTTP 200 ("OK") và văn bản thuần túy "Hello World".

   > [!NOTE]
   > Đừng lo lắng nếu bạn chưa hiểu chính xác mã này đang làm gì! Chúng tôi sẽ giải thích mã của mình chi tiết hơn khi chúng tôi bắt đầu sử dụng Express!

2. Khởi động máy chủ bằng cách điều hướng đến cùng thư mục với tệp `hellonode.js` trong command prompt của bạn và gọi `node` cùng với tên script, như sau:

   ```bash
   node hellonode.js
   ```

   Sau khi máy chủ khởi động, bạn sẽ thấy đầu ra console cho biết địa chỉ IP mà máy chủ đang chạy trên đó:

   ```plain
   Server running at http://127.0.0.1:3000/
   ```

3. Điều hướng đến URL `http://127.0.0.1:3000`. Nếu mọi thứ đang hoạt động, trình duyệt sẽ hiển thị chuỗi "Hello World".

## Sử dụng npm

Ngoài _Node_ bản thân, [npm](https://docs.npmjs.com/) là công cụ quan trọng nhất để làm việc với các ứng dụng _Node_.
`npm` được sử dụng để tải xuống bất kỳ gói nào (thư viện JavaScript) mà ứng dụng cần để phát triển, kiểm thử và/hoặc sản xuất, và cũng có thể được sử dụng để chạy các bài kiểm thử và công cụ được sử dụng trong quá trình phát triển.

> [!NOTE]
> Từ quan điểm của Node, _Express_ chỉ là một gói khác mà bạn cần cài đặt bằng npm và sau đó yêu cầu trong mã của bạn.

Bạn có thể sử dụng npm theo cách thủ công để tải xuống riêng biệt từng gói cần thiết. Thông thường thay vào đó chúng tôi quản lý các phụ thuộc bằng tệp định nghĩa văn bản thuần túy có tên [package.json](https://docs.npmjs.com/files/package.json/). Tệp này liệt kê tất cả các phụ thuộc cho một "gói" JavaScript cụ thể, bao gồm tên gói, phiên bản, mô tả, tệp đầu tiên cần thực thi, phụ thuộc sản xuất, phụ thuộc phát triển, phiên bản _Node_ mà nó có thể làm việc với, v.v. Tệp **package.json** nên chứa mọi thứ npm cần để tải xuống và chạy ứng dụng của bạn (nếu bạn đang viết thư viện có thể tái sử dụng, bạn có thể sử dụng định nghĩa này để tải lên gói của mình lên kho npm và làm cho nó có sẵn cho người dùng khác).

### Thêm phụ thuộc

Các bước sau đây hiển thị cách bạn có thể sử dụng npm để tải xuống gói, lưu nó vào các phụ thuộc dự án và sau đó yêu cầu nó trong ứng dụng Node.

> [!NOTE]
> Ở đây chúng tôi hiển thị hướng dẫn để tải xuống và cài đặt gói _Express_. Sau này chúng tôi sẽ chỉ ra cách gói này và các gói khác đã được chỉ định sẵn cho chúng tôi bằng _Trình tạo ứng dụng Express_. Phần này được cung cấp vì nó hữu ích để hiểu cách npm hoạt động và những gì đang được tạo ra bởi trình tạo ứng dụng.

1. Đầu tiên tạo thư mục cho ứng dụng mới của bạn và điều hướng vào đó:

   ```bash
   mkdir myapp
   cd myapp
   ```

2. Sử dụng lệnh `init` của npm để tạo tệp **package.json** cho ứng dụng của bạn. Lệnh này yêu cầu bạn một số thứ, bao gồm tên và phiên bản của ứng dụng và tên của tệp điểm vào ban đầu (mặc định là **index.js**). Bây giờ, chỉ cần chấp nhận các giá trị mặc định:

   ```bash
   npm init
   ```

   Nếu bạn hiển thị tệp **package.json** (`cat package.json`), bạn sẽ thấy các giá trị mặc định mà bạn đã chấp nhận, kết thúc với giấy phép.

   ```json
   {
     "name": "myapp",
     "version": "1.0.0",
     "main": "index.js",
     "scripts": {
       "test": "echo \"Error: no test specified\" && exit 1"
     },
     "author": "",
     "license": "ISC",
     "description": ""
   }
   ```

3. Bây giờ cài đặt Express trong thư mục `myapp` và lưu nó vào danh sách phụ thuộc trong tệp **package.json** của bạn:

   ```bash
   npm install express
   ```

   Phần phụ thuộc trong **package.json** của bạn sẽ xuất hiện ở cuối tệp **package.json** và sẽ bao gồm _Express_.

   ```json
   {
     "name": "myapp",
     "version": "1.0.0",
     "description": "",
     "main": "index.js",
     "scripts": {
       "test": "echo \"Error: no test specified\" && exit 1"
     },
     "author": "",
     "license": "ISC",
     "dependencies": {
       "express": "^5.1.0"
     }
   }
   ```

4. Để sử dụng thư viện Express, bạn gọi hàm `require()` trong tệp **index.js** của mình để đưa nó vào ứng dụng của bạn.
   Tạo tệp này bây giờ, trong thư mục gốc của ứng dụng "myapp" và cho nó nội dung sau:

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

   Mã này hiển thị ứng dụng web Express "HelloWorld" tối thiểu.
   Điều này import module "express" bằng `require()` và sử dụng nó để tạo máy chủ (`app`) lắng nghe các yêu cầu HTTP trên cổng 3000 và in thông báo vào console giải thích URL trình duyệt nào bạn có thể sử dụng để kiểm tra máy chủ.
   Hàm `app.get()` chỉ phản hồi các yêu cầu HTTP `GET` với đường dẫn URL được chỉ định ('/'), trong trường hợp này bằng cách gọi một hàm để gửi thông báo _Hello World!_ của chúng tôi.

   > [!NOTE]
   > Dấu backtick trong `` `Example app listening on port ${port}!` `` cho phép chúng tôi nội suy giá trị của `$port` vào chuỗi.

5. Bạn có thể khởi động máy chủ bằng cách gọi node với script trong command prompt của bạn:

   ```bash
   node index.js
   ```

   Bạn sẽ thấy đầu ra console sau:

   ```plain
   Example app listening on port 3000
   ```

6. Điều hướng đến URL `http://localhost:3000/`.
   Nếu mọi thứ đang hoạt động, trình duyệt sẽ hiển thị chuỗi "Hello World!".

### Phụ thuộc phát triển

Nếu một phụ thuộc chỉ được sử dụng trong quá trình phát triển, bạn nên lưu nó như một "phụ thuộc phát triển" (để người dùng gói của bạn không phải cài đặt nó trong môi trường sản xuất). Ví dụ: để sử dụng công cụ JavaScript Linting phổ biến [ESLint](https://eslint.org/), bạn sẽ gọi npm như được hiển thị:

```bash
npm install eslint --save-dev
```

Mục nhập sau sẽ được thêm vào **package.json** của ứng dụng của bạn:

```json
{
  "devDependencies": {
    "eslint": "^9.30.1"
  }
}
```

> [!NOTE]
> "[Linters](<https://en.wikipedia.org/wiki/Lint_(software)>)" là các công cụ thực hiện phân tích tĩnh trên phần mềm để nhận ra và báo cáo việc tuân thủ/không tuân thủ một tập hợp thực hành tốt nhất về mã hóa.

### Chạy tác vụ

Ngoài việc định nghĩa và tải xuống các phụ thuộc, bạn cũng có thể định nghĩa các script _được đặt tên_ trong tệp **package.json** của mình và gọi npm để thực thi chúng với lệnh [run-script](https://docs.npmjs.com/cli/commands/npm-run/). Cách tiếp cận này thường được sử dụng để tự động hóa việc chạy các bài kiểm thử và các phần của chuỗi công cụ phát triển hoặc xây dựng (ví dụ: chạy các công cụ để rút gọn JavaScript, thu nhỏ hình ảnh, LINT/phân tích mã của bạn, v.v.).

> [!NOTE]
> Các trình chạy tác vụ như [Gulp](https://gulpjs.com/) và [Grunt](https://gruntjs.com/) cũng có thể được sử dụng để chạy kiểm thử và các công cụ bên ngoài khác.

Ví dụ: để định nghĩa script để chạy phụ thuộc phát triển _eslint_ mà chúng tôi đã chỉ định trong phần trước, chúng tôi có thể thêm khối script sau vào tệp **package.json** của mình (giả sử nguồn ứng dụng của chúng tôi nằm trong thư mục `/src/js`):

```json
{
  "scripts": {
    // …
    "lint": "eslint src/js"
    // …
  }
}
```

Để giải thích thêm một chút, `eslint src/js` là lệnh mà chúng tôi có thể nhập vào terminal/dòng lệnh của mình để chạy `eslint` trên các tệp JavaScript chứa trong thư mục `src/js` bên trong thư mục ứng dụng của chúng tôi. Bao gồm ở trên vào tệp package.json của ứng dụng của chúng tôi cung cấp lối tắt cho lệnh này — `lint`.

Sau đó chúng tôi có thể chạy _eslint_ bằng npm bằng cách gọi:

```bash
npm run-script lint
# OR (using the alias)
npm run lint
```

Ví dụ này có thể không trông ngắn hơn lệnh gốc, nhưng bạn có thể bao gồm các lệnh lớn hơn nhiều bên trong các script npm của mình, bao gồm các chuỗi nhiều lệnh. Bạn có thể xác định một npm script duy nhất chạy tất cả các bài kiểm thử của bạn cùng một lúc.

## Cài đặt Trình tạo ứng dụng Express

Công cụ [Trình tạo ứng dụng Express](https://expressjs.com/en/starter/generator.html) tạo ra "khung" ứng dụng Express. Cài đặt trình tạo bằng npm như được hiển thị:

```bash
npm install express-generator -g
```

> [!NOTE]
> Bạn có thể cần đặt tiền tố cho dòng này bằng `sudo` trên Ubuntu hoặc macOS. Cờ `-g` cài đặt công cụ toàn cục để bạn có thể gọi nó từ bất kỳ đâu.

Để tạo ứng dụng _Express_ có tên "helloworld" với các cài đặt mặc định, điều hướng đến nơi bạn muốn tạo nó và chạy ứng dụng như được hiển thị:

```bash
express helloworld
```

> [!NOTE]
> Trừ khi bạn đang sử dụng phiên bản nodejs cũ (< 8.2.0), bạn có thể bỏ qua việc cài đặt và chạy express-generator với [npx](https://github.com/npm/npx#readme).
> Điều này có hiệu ứng tương tự như cài đặt và chạy `express-generator` nhưng không cài đặt gói trên hệ thống của bạn:
>
> ```bash
> npx express-generator helloworld
> ```

Bạn cũng có thể chỉ định thư viện mẫu để sử dụng và một số cài đặt khác.
Sử dụng lệnh `help` để xem tất cả các tùy chọn:

```bash
express --help
```

Trình tạo sẽ tạo ứng dụng Express mới trong thư mục con của vị trí hiện tại của bạn, hiển thị tiến trình xây dựng trên console.
Khi hoàn thành, công cụ sẽ hiển thị các lệnh bạn cần nhập để cài đặt các phụ thuộc Node và khởi động ứng dụng.

Ứng dụng mới sẽ có tệp **package.json** trong thư mục gốc của nó.
Bạn có thể mở nó để xem các phụ thuộc nào được cài đặt, bao gồm Express và thư viện mẫu Jade:

```json
{
  "name": "helloworld",
  "version": "0.0.0",
  "private": true,
  "scripts": {
    "start": "node ./bin/www"
  },
  "dependencies": {
    "cookie-parser": "~1.4.4",
    "debug": "~2.6.9",
    "express": "~4.16.1",
    "http-errors": "~1.6.3",
    "jade": "~1.11.0",
    "morgan": "~1.9.1"
  }
}
```

Cài đặt tất cả các phụ thuộc cho ứng dụng helloworld bằng npm như được hiển thị:

```bash
cd helloworld
npm install
```

Sau đó chạy ứng dụng (các lệnh hơi khác nhau đối với Windows và Linux/macOS), như được hiển thị bên dưới:

```bash
# Run helloworld on Windows with Command Prompt
SET DEBUG=helloworld:* & npm start

# Run helloworld on Windows with PowerShell
SET DEBUG=helloworld:* | npm start

# Run helloworld on Linux/macOS
DEBUG=helloworld:* npm start
```

Lệnh DEBUG tạo ra logging hữu ích, dẫn đến đầu ra như sau:

```bash
>SET DEBUG=helloworld:* & npm start

> helloworld@0.0.0 start D:\GitHub\express-tests\helloworld
> node ./bin/www

  helloworld:server Listening on port 3000 +0ms
```

Mở trình duyệt và điều hướng đến `http://localhost:3000/` để xem trang chào mừng Express mặc định.

![Express - Generated App Default Screen](express_default_screen.png)

Chúng tôi sẽ nói thêm về ứng dụng được tạo khi chúng tôi đến bài viết về tạo ứng dụng khung.

## Tóm tắt

Bây giờ bạn đã có môi trường phát triển Node đang hoạt động và chạy trên máy tính của mình, có thể được sử dụng để tạo ứng dụng web Express. Bạn cũng đã thấy cách npm có thể được sử dụng để import Express vào ứng dụng, và cũng cách bạn có thể tạo các ứng dụng bằng công cụ Trình tạo ứng dụng Express và sau đó chạy chúng.

Trong bài viết tiếp theo, chúng tôi bắt đầu làm việc qua hướng dẫn để xây dựng một ứng dụng web hoàn chỉnh bằng cách sử dụng môi trường và các công cụ liên quan này.

## Xem thêm

- Trang [Downloads](https://nodejs.org/en/download) (nodejs.org)
- [Cài đặt Express](https://expressjs.com/en/starter/installing.html) (expressjs.com)
- [Trình tạo ứng dụng Express](https://expressjs.com/en/starter/generator.html) (expressjs.com)
- [Sử dụng Node.js với Windows subsystem for Linux](https://learn.microsoft.com/en-us/windows/dev-environment/javascript/) (docs.microsoft.com)

{{PreviousMenuNext("Learn_web_development/Extensions/Server-side/Express_Nodejs/Introduction", "Learn_web_development/Extensions/Server-side/Express_Nodejs/Tutorial_local_library_website", "Learn_web_development/Extensions/Server-side/Express_Nodejs")}}
