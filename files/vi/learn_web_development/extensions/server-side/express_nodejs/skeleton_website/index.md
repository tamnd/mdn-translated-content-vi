---
title: "Hướng dẫn Express Phần 2: Tạo trang web khung"
short-title: "2: Skeleton website"
slug: Learn_web_development/Extensions/Server-side/Express_Nodejs/skeleton_website
page-type: learn-module-chapter
sidebar: learnsidebar
---

{{PreviousMenuNext("Learn_web_development/Extensions/Server-side/Express_Nodejs/Tutorial_local_library_website", "Learn_web_development/Extensions/Server-side/Express_Nodejs/mongoose", "Learn_web_development/Extensions/Server-side/Express_Nodejs")}}

Bài viết thứ hai trong [Hướng dẫn Express](/en-US/docs/Learn_web_development/Extensions/Server-side/Express_Nodejs/Tutorial_local_library_website) của chúng tôi chỉ ra cách bạn có thể tạo dự án trang web "khung" mà sau đó bạn có thể tiếp tục điền vào với các route, mẫu/views và các lệnh gọi cơ sở dữ liệu dành riêng cho trang web.

<table>
  <tbody>
    <tr>
      <th scope="row">Điều kiện tiên quyết:</th>
      <td>
        <a href="/en-US/docs/Learn_web_development/Extensions/Server-side/Express_Nodejs/development_environment">Thiết lập môi trường phát triển Node</a>.
          Xem lại Hướng dẫn Express.
      </td>
    </tr>
    <tr>
      <th scope="row">Mục tiêu:</th>
      <td>
        Để có thể bắt đầu các dự án trang web mới của riêng bạn bằng cách sử dụng <em>Trình tạo ứng dụng Express</em>.
      </td>
    </tr>
  </tbody>
</table>

## Tổng quan

Bài viết này chỉ ra cách bạn có thể tạo trang web "khung" bằng công cụ [Trình tạo ứng dụng Express](https://expressjs.com/en/starter/generator.html), sau đó bạn có thể điền vào với các route, views/mẫu và các lệnh gọi cơ sở dữ liệu dành riêng cho trang web. Trong trường hợp này, chúng tôi sẽ sử dụng công cụ để tạo framework cho [trang web Thư viện cục bộ](/en-US/docs/Learn_web_development/Extensions/Server-side/Express_Nodejs/Tutorial_local_library_website), mà sau đó chúng tôi sẽ thêm tất cả mã khác cần thiết bởi trang web. Quy trình cực kỳ đơn giản, chỉ yêu cầu bạn gọi trình tạo trên dòng lệnh với tên dự án mới, tùy chọn cũng chỉ định công cụ mẫu và trình tạo CSS của trang web.

Các phần sau đây chỉ cho bạn cách gọi trình tạo ứng dụng và cung cấp một chút giải thích về các tùy chọn view/CSS khác nhau. Chúng tôi cũng sẽ giải thích cách trang web khung được cấu trúc. Cuối cùng, chúng tôi sẽ chỉ ra cách bạn có thể chạy trang web để xác minh rằng nó hoạt động.

> [!NOTE]
>
> - _Trình tạo ứng dụng Express_ không phải là trình tạo duy nhất cho các ứng dụng Express và dự án được tạo không phải là cách duy nhất khả thi để cấu trúc các tệp và thư mục của bạn. Tuy nhiên, trang web được tạo có cấu trúc mô-đun dễ mở rộng và hiểu. Để biết thông tin về ứng dụng Express _tối thiểu_, xem [Ví dụ Hello world](https://expressjs.com/en/starter/hello-world.html) (Tài liệu Express).
> - _Trình tạo ứng dụng Express_ khai báo hầu hết các biến bằng `var`.
>   Chúng tôi đã thay đổi hầu hết trong số này thành [`const`](/en-US/docs/Web/JavaScript/Reference/Statements/const) (và một vài cái thành [`let`](/en-US/docs/Web/JavaScript/Reference/Statements/let)) trong hướng dẫn, vì chúng tôi muốn thể hiện thực hành JavaScript hiện đại.
> - Hướng dẫn này sử dụng phiên bản _Express_ và các phụ thuộc khác được định nghĩa trong **package.json** được tạo bởi _Trình tạo ứng dụng Express_.
>   Đây không phải là (nhất thiết) phiên bản mới nhất và bạn nên cập nhật chúng khi triển khai ứng dụng thực tế lên môi trường sản xuất.

## Sử dụng trình tạo ứng dụng

Bạn nên đã cài đặt trình tạo như một phần của [thiết lập môi trường phát triển Node](/en-US/docs/Learn_web_development/Extensions/Server-side/Express_Nodejs/development_environment). Để nhắc nhanh, bạn cài đặt công cụ trình tạo toàn trang web bằng trình quản lý gói npm, như được hiển thị:

```bash
npm install express-generator -g
```

Trình tạo có một số tùy chọn, mà bạn có thể xem trên dòng lệnh bằng cách sử dụng lệnh `--help` (hoặc `-h`):

```bash
> express --help

    Usage: express [options] [dir]

  Options:

        --version        output the version number
    -e, --ejs            add ejs engine support
        --pug            add pug engine support
        --hbs            add handlebars engine support
    -H, --hogan          add hogan.js engine support
    -v, --view <engine>  add view <engine> support (dust|ejs|hbs|hjs|jade|pug|twig|vash) (defaults to jade)
        --no-view        use static html instead of view engine
    -c, --css <engine>   add stylesheet <engine> support (less|stylus|compass|sass) (defaults to plain CSS)
        --git            add .gitignore
    -f, --force          force on non-empty directory
    -h, --help           output usage information
```

Bạn có thể chỉ định express để tạo dự án trong thư mục _hiện tại_ bằng cách sử dụng công cụ view _Jade_ và CSS thuần túy (nếu bạn chỉ định tên thư mục thì dự án sẽ được tạo trong thư mục con với tên đó).

```bash
express
```

Bạn cũng có thể chọn công cụ view (mẫu) bằng cách sử dụng `--view` và/hoặc công cụ tạo CSS bằng cách sử dụng `--css`.

> [!NOTE]
> Các tùy chọn khác để chọn công cụ mẫu (ví dụ: `--hogan`, `--ejs`, `--hbs` v.v.) đã không còn được dùng nữa. Sử dụng `--view` (hoặc `-v`).

### Tôi nên sử dụng công cụ view nào?

_Trình tạo ứng dụng Express_ cho phép bạn cấu hình một số công cụ view/mẫu phổ biến, bao gồm [EJS](https://www.npmjs.com/package/ejs), [Hbs](https://github.com/pillarjs/hbs), [Pug](https://pugjs.org/api/getting-started.html) (Jade), [Twig](https://www.npmjs.com/package/twig) và [Vash](https://www.npmjs.com/package/vash), mặc dù nó chọn Jade theo mặc định nếu bạn không chỉ định tùy chọn view. Express bản thân cũng có thể hỗ trợ một số lượng lớn các ngôn ngữ mẫu khác [ngay lập tức](https://github.com/expressjs/express/wiki#template-engines).

> [!NOTE]
> Nếu bạn muốn sử dụng công cụ mẫu không được trình tạo hỗ trợ thì hãy xem [Sử dụng công cụ mẫu với Express](https://expressjs.com/en/guide/using-template-engines.html) (Tài liệu Express) và tài liệu cho công cụ view mục tiêu của bạn.

Nói chung, bạn nên chọn công cụ mẫu cung cấp tất cả chức năng bạn cần và cho phép bạn năng suất sớm hơn — nói cách khác, giống như cách bạn chọn bất kỳ thành phần nào khác! Một số điều cần xem xét khi so sánh các công cụ mẫu:

- Thời gian đến năng suất — Nếu nhóm của bạn đã có kinh nghiệm với ngôn ngữ mẫu thì họ có khả năng sẽ năng suất nhanh hơn khi sử dụng ngôn ngữ đó. Nếu không, thì bạn nên xem xét đường cong học tập tương đối cho các công cụ mẫu ứng cử viên.
- Phổ biến và hoạt động — Xem xét sự phổ biến của công cụ và liệu nó có cộng đồng năng động hay không. Điều quan trọng là có thể nhận được hỗ trợ khi phát sinh vấn đề trong suốt vòng đời của trang web.
- Phong cách — Một số công cụ mẫu sử dụng đánh dấu cụ thể để chỉ ra nội dung được chèn trong HTML "thông thường", trong khi các cái khác xây dựng HTML bằng cách sử dụng cú pháp khác (ví dụ: sử dụng thụt lề và tên khối).
- Hiệu suất/thời gian render.
- Các tính năng — bạn nên xem xét liệu các công cụ bạn xem xét có các tính năng sau hay không:
  - Kế thừa bố cục: Cho phép bạn định nghĩa mẫu cơ sở và sau đó "kế thừa" chỉ những phần của nó mà bạn muốn khác nhau cho một trang cụ thể. Đây thường là cách tiếp cận tốt hơn so với xây dựng mẫu bằng cách bao gồm một số thành phần bắt buộc hoặc xây dựng mẫu từ đầu mỗi lần.
  - Hỗ trợ "Include": Cho phép bạn xây dựng mẫu bằng cách bao gồm các mẫu khác.
  - Cú pháp điều khiển biến và vòng lặp ngắn gọn.
  - Khả năng lọc giá trị biến ở cấp độ mẫu, chẳng hạn như làm cho biến in hoa, hoặc định dạng giá trị ngày.
  - Khả năng tạo các định dạng đầu ra khác với HTML, chẳng hạn như JSON hoặc XML.
  - Hỗ trợ cho các hoạt động bất đồng bộ và streaming.
  - Tính năng phía máy khách. Nếu công cụ mẫu có thể được sử dụng ở phía máy khách, điều này cho phép khả năng có tất cả hoặc hầu hết rendering được thực hiện phía máy khách.

> [!NOTE]
> Có nhiều tài nguyên trên Internet để giúp bạn so sánh các tùy chọn khác nhau!

Cho dự án này, chúng tôi sẽ sử dụng công cụ mẫu [Pug](https://pugjs.org/api/getting-started.html) (trước đây được gọi là "Jade"), vì đây là một trong những ngôn ngữ mẫu Express/JavaScript phổ biến nhất và được trình tạo hỗ trợ ngay lập tức.

### Tôi nên sử dụng công cụ CSS stylesheet nào?

_Trình tạo ứng dụng Express_ cho phép bạn tạo dự án được cấu hình để sử dụng các công cụ CSS stylesheet phổ biến nhất: [LESS](https://lesscss.org/), [SASS](https://sass-lang.com/), [Stylus](https://stylus-lang.com/).

> [!NOTE]
> CSS có một số hạn chế làm cho một số tác vụ khó khăn. Các công cụ CSS stylesheet cho phép bạn sử dụng cú pháp mạnh hơn để định nghĩa CSS của mình và sau đó biên dịch định nghĩa thành CSS thuần túy cho trình duyệt sử dụng.

Như với các công cụ mẫu, bạn nên sử dụng công cụ stylesheet sẽ cho phép nhóm của bạn năng suất nhất. Cho dự án này, chúng tôi sẽ sử dụng CSS thuần (mặc định) vì các yêu cầu CSS của chúng tôi không đủ phức tạp để biện minh cho việc sử dụng bất cứ thứ gì khác.

### Tôi nên sử dụng cơ sở dữ liệu nào?

Mã được tạo ra không sử dụng/bao gồm bất kỳ cơ sở dữ liệu nào. Các ứng dụng _Express_ có thể sử dụng bất kỳ [cơ chế cơ sở dữ liệu](https://expressjs.com/en/guide/database-integration.html) nào được _Node_ hỗ trợ (_Express_ bản thân không định nghĩa bất kỳ hành vi/yêu cầu bổ sung cụ thể nào cho quản lý cơ sở dữ liệu).

Chúng tôi sẽ thảo luận về cách tích hợp với cơ sở dữ liệu trong một bài viết sau.

## Tạo dự án

Cho ứng dụng _Thư viện cục bộ_ mẫu mà chúng tôi sắp xây dựng, chúng tôi sẽ tạo dự án có tên _express-locallibrary-tutorial_ bằng cách sử dụng thư viện mẫu _Pug_ và không có công cụ CSS nào.

Đầu tiên, điều hướng đến nơi bạn muốn tạo dự án và sau đó chạy _Trình tạo ứng dụng Express_ trong command prompt như được hiển thị:

```bash
express express-locallibrary-tutorial --view=pug
```

Trình tạo sẽ tạo (và liệt kê) các tệp của dự án.

```plain
   create : express-locallibrary-tutorial\
   create : express-locallibrary-tutorial\public\
   create : express-locallibrary-tutorial\public\javascripts\
   create : express-locallibrary-tutorial\public\images\
   create : express-locallibrary-tutorial\public\stylesheets\
   create : express-locallibrary-tutorial\public\stylesheets\style.css
   create : express-locallibrary-tutorial\routes\
   create : express-locallibrary-tutorial\routes\index.js
   create : express-locallibrary-tutorial\routes\users.js
   create : express-locallibrary-tutorial\views\
   create : express-locallibrary-tutorial\views\error.pug
   create : express-locallibrary-tutorial\views\index.pug
   create : express-locallibrary-tutorial\views\layout.pug
   create : express-locallibrary-tutorial\app.js
   create : express-locallibrary-tutorial\package.json
   create : express-locallibrary-tutorial\bin\
   create : express-locallibrary-tutorial\bin\www

   change directory:
     > cd express-locallibrary-tutorial

   install dependencies:
     > npm install

   run the app (Bash (Linux or macOS))
     > DEBUG=express-locallibrary-tutorial:* npm start

   run the app (PowerShell (Windows))
     > $env:DEBUG = "express-locallibrary-tutorial:*"; npm start

   run the app (Command Prompt (Windows)):
     > SET DEBUG=express-locallibrary-tutorial:* & npm start
```

Ở cuối đầu ra, trình tạo cung cấp hướng dẫn về cách cài đặt các phụ thuộc (như được liệt kê trong tệp **package.json**) và cách chạy ứng dụng trên các hệ điều hành khác nhau.

> [!NOTE]
> Các tệp do trình tạo tạo ra định nghĩa tất cả các biến là `var`.
> Mở tất cả các tệp được tạo và thay đổi khai báo `var` thành `const` trước khi bạn tiếp tục (phần còn lại của hướng dẫn giả định rằng bạn đã làm như vậy).

## Chạy trang web khung

Tại thời điểm này, chúng tôi có một dự án khung hoàn chỉnh. Trang web thực sự chưa _làm_ nhiều lắm, nhưng đáng để chạy nó để hiển thị rằng nó hoạt động.

1. Đầu tiên, cài đặt các phụ thuộc (lệnh `install` sẽ tải xuống tất cả các gói phụ thuộc được liệt kê trong tệp **package.json** của dự án).

   ```bash
   cd express-locallibrary-tutorial
   npm install
   ```

2. Sau đó chạy ứng dụng.
   - Trên command prompt CMD của Windows, sử dụng lệnh này:

     ```batch
     SET DEBUG=express-locallibrary-tutorial:* & npm start
     ```

   - Trên Windows PowerShell, sử dụng lệnh này:

     ```powershell
     $env:DEBUG = "express-locallibrary-tutorial:*"; npm start
     ```

     > [!NOTE]
     > Các lệnh PowerShell không được đề cập trong hướng dẫn này (Các lệnh "Windows" được cung cấp giả định bạn đang sử dụng command prompt CMD của Windows.)

   - Trên macOS hoặc Linux, sử dụng lệnh này:

     ```bash
     DEBUG=express-locallibrary-tutorial:* npm start
     ```

3. Sau đó tải `http://localhost:3000/` trong trình duyệt của bạn để truy cập ứng dụng.

Bạn sẽ thấy trang trình duyệt trông như thế này:

![Browser for default Express app generator website](expressgeneratorskeletonwebsite.png)

Xin chúc mừng! Bây giờ bạn có một ứng dụng Express đang hoạt động có thể được truy cập qua cổng 3000.

> [!NOTE]
> Bạn cũng có thể khởi động ứng dụng chỉ bằng lệnh `npm start`. Chỉ định biến DEBUG như được hiển thị cho phép logging/debugging console. Ví dụ: khi bạn truy cập trang trên, bạn sẽ thấy đầu ra debug như thế này:
>
> ```bash
> SET DEBUG=express-locallibrary-tutorial:* & npm start
> ```
>
> ```plain
> > express-locallibrary-tutorial@0.0.0 start D:\github\mdn\test\exprgen\express-locallibrary-tutorial
> > node ./bin/www
>
>   express-locallibrary-tutorial:server Listening on port 3000 +0ms
> GET / 304 490.296 ms - -
> GET /stylesheets/style.css 200 4.886 ms - 111
> ```

## Bật khởi động lại máy chủ khi thay đổi tệp

Bất kỳ thay đổi nào bạn thực hiện trên trang web Express của mình hiện không hiển thị cho đến khi bạn khởi động lại máy chủ. Việc phải dừng và khởi động lại máy chủ mỗi khi bạn thực hiện thay đổi nhanh chóng trở nên rất khó chịu, vì vậy đáng để dành thời gian tự động hóa việc khởi động lại máy chủ khi cần.

Một công cụ tiện lợi cho mục đích này là [nodemon](https://github.com/remy/nodemon). Công cụ này thường được cài đặt toàn cục (vì nó là một "công cụ"), nhưng ở đây chúng tôi sẽ cài đặt và sử dụng nó cục bộ như một _phụ thuộc dành cho nhà phát triển_, để bất kỳ nhà phát triển nào làm việc với dự án đều tự động nhận được khi họ cài đặt ứng dụng. Sử dụng lệnh sau trong thư mục gốc cho dự án khung:

```bash
npm install --save-dev nodemon
```

Nếu bạn vẫn chọn cài đặt [nodemon](https://github.com/remy/nodemon) toàn cục vào máy của bạn và không chỉ vào tệp **package.json** của dự án của bạn:

```bash
npm install -g nodemon
```

Nếu bạn mở tệp **package.json** của dự án, bạn sẽ thấy một phần mới với phụ thuộc này:

```json
{
  "devDependencies": {
    "nodemon": "^3.1.10"
  }
}
```

Vì công cụ không được cài đặt toàn cục, chúng tôi không thể khởi chạy nó từ dòng lệnh (trừ khi chúng tôi thêm nó vào đường dẫn). Tuy nhiên, chúng tôi có thể gọi nó từ script npm vì npm biết các gói nào được cài đặt. Tìm phần `scripts` trong **package.json** của bạn. Ban đầu, nó sẽ chứa một dòng bắt đầu bằng `"start"`. Cập nhật nó bằng cách đặt dấu phẩy ở cuối dòng đó và thêm các dòng `"devstart"` và `"serverstart"`:

- Trên Linux và macOS, phần scripts sẽ trông như thế này:

  ```json
  {
    "scripts": {
      "start": "node ./bin/www",
      "devstart": "nodemon ./bin/www",
      "serverstart": "DEBUG=express-locallibrary-tutorial:* npm run devstart"
    }
  }
  ```

- Trên Windows, giá trị "serverstart" thay vào đó sẽ trông như thế này (nếu sử dụng command prompt):

  ```bash
  "serverstart": "SET DEBUG=express-locallibrary-tutorial:* & npm run devstart"
  ```

Bây giờ chúng tôi có thể khởi động máy chủ theo cách gần giống như trước đó, nhưng sử dụng lệnh `devstart`.

> [!NOTE]
> Bây giờ nếu bạn chỉnh sửa bất kỳ tệp nào trong dự án, máy chủ sẽ khởi động lại (hoặc bạn có thể khởi động lại nó bằng cách gõ `rs` trên command prompt bất cứ lúc nào). Bạn vẫn sẽ cần tải lại trình duyệt để làm mới trang.
>
> Bây giờ chúng tôi phải gọi `npm run <script-name>` thay vì chỉ `npm start`, vì "start" thực sự là lệnh npm được ánh xạ tới script được đặt tên. Chúng tôi có thể đã thay thế lệnh trong script _start_ nhưng chúng tôi chỉ muốn sử dụng _nodemon_ trong quá trình phát triển, vì vậy có ý nghĩa khi tạo một lệnh script mới.
>
> Lệnh `serverstart` được thêm vào scripts trong **package.json** ở trên là một ví dụ rất tốt. Sử dụng cách tiếp cận này có nghĩa là bạn không còn phải gõ một lệnh dài để khởi động máy chủ. Lưu ý rằng lệnh cụ thể được thêm vào script chỉ hoạt động cho macOS hoặc Linux.

## Dự án được tạo

Bây giờ hãy xem dự án mà chúng tôi vừa tạo.
Chúng tôi sẽ thực hiện một số sửa đổi nhỏ trong khi tiến hành.

### Cấu trúc thư mục

Dự án được tạo, bây giờ bạn đã cài đặt các phụ thuộc, có cấu trúc tệp sau (các tệp là các mục **không** có tiền tố "/").
Tệp **package.json** định nghĩa các phụ thuộc ứng dụng và thông tin khác.
Nó cũng định nghĩa script khởi động sẽ gọi điểm vào ứng dụng, tệp JavaScript **/bin/www**.
Điều này thiết lập một số xử lý lỗi ứng dụng và sau đó tải **app.js** để thực hiện phần còn lại của công việc.
Các route ứng dụng được lưu trữ trong các module riêng biệt dưới thư mục **routes/**.
Các mẫu được lưu trữ dưới thư mục /**views**.

```plain
express-locallibrary-tutorial
    app.js
    /bin
        www
    package.json
    package-lock.json
    /node_modules
        [about 6700 subdirectories and files]
    /public
        /images
        /javascripts
        /stylesheets
            style.css
    /routes
        index.js
        users.js
    /views
        error.pug
        index.pug
        layout.pug
```

Các phần sau mô tả các tệp chi tiết hơn.

### package.json

Tệp **package.json** định nghĩa các phụ thuộc ứng dụng và thông tin khác:

```json
{
  "name": "express-locallibrary-tutorial",
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
    "morgan": "~1.9.1",
    "pug": "2.0.0-beta11"
  },
  "devDependencies": {
    "nodemon": "^3.1.10"
  }
}
```

Phần scripts đầu tiên định nghĩa script "_start_", là những gì chúng tôi gọi khi gọi `npm start` để khởi động máy chủ (script này được thêm bởi _Trình tạo ứng dụng Express_). Từ định nghĩa script, bạn có thể thấy rằng điều này thực sự khởi động tệp JavaScript **./bin/www** với _node_.

Chúng tôi đã sửa đổi phần này trong [Bật khởi động lại máy chủ khi thay đổi tệp](#enable_server_restart_on_file_changes) bằng cách thêm các script _devstart_ và _serverstart_.
Chúng có thể được sử dụng để khởi động cùng tệp **./bin/www** với _nodemon_ thay vì _node_ (phiên bản này của scripts dành cho Linux và macOS, như đã thảo luận ở trên).

```json
{
  "scripts": {
    "start": "node ./bin/www",
    "devstart": "nodemon ./bin/www",
    "serverstart": "DEBUG=express-locallibrary-tutorial:* npm run devstart"
  }
}
```

Các phụ thuộc bao gồm gói _express_ và gói cho công cụ view đã chọn của chúng tôi (_pug_).
Ngoài ra, chúng tôi có các gói sau hữu ích trong nhiều ứng dụng web:

- [cookie-parser](https://www.npmjs.com/package/cookie-parser): Được sử dụng để phân tích tiêu đề cookie và điền `req.cookies` (về cơ bản cung cấp phương pháp tiện lợi để truy cập thông tin cookie).
- [debug](https://www.npmjs.com/package/debug): Một tiện ích gỡ lỗi node nhỏ được mô hình theo kỹ thuật gỡ lỗi cốt lõi của node.
- [morgan](https://www.npmjs.com/package/morgan): Middleware logger HTTP request cho node.
- [http-errors](https://www.npmjs.com/package/http-errors): Tạo lỗi HTTP khi cần (cho xử lý lỗi express).

Các phiên bản mặc định trong dự án được tạo hơi lỗi thời.
Thay thế phần dependencies trong tệp `package.json` của bạn bằng văn bản sau, chỉ định các phiên bản mới nhất của các thư viện này tại thời điểm viết:

```json
{
  "dependencies": {
    "cookie-parser": "^1.4.7",
    "debug": "^4.4.1",
    "express": "^5.1.0",
    "http-errors": "~2.0.0",
    "morgan": "^1.10.0",
    "pug": "3.0.3"
  }
}
```

Sau đó cập nhật các phụ thuộc đã cài đặt của bạn bằng lệnh:

```bash
npm install
```

> [!NOTE]
> Đây là ý tưởng hay để thường xuyên cập nhật lên các phiên bản tương thích mới nhất của thư viện phụ thuộc của bạn — điều này thậm chí có thể được thực hiện tự động hoặc bán tự động như một phần của thiết lập {{glossary("continuous integration")}}.
>
> Thường thì các cập nhật thư viện lên phiên bản minor và patch vẫn tương thích.
> Chúng tôi đã đặt tiền tố mỗi phiên bản bằng `^` ở trên để chúng tôi có thể tự động cập nhật lên phiên bản `minor.patch` mới nhất bằng cách chạy:
>
> ```bash
> npm update --save
> ```
>
> Các phiên bản major thay đổi tính tương thích.
> Đối với các cập nhật đó, chúng tôi sẽ cần cập nhật thủ công `package.json` và mã sử dụng thư viện, và kiểm thử lại dự án một cách kỹ lưỡng.

### Tệp www

Tệp **/bin/www** là điểm vào ứng dụng! Điều đầu tiên nó làm là `require()` điểm vào ứng dụng "thực" (**app.js**, trong thư mục gốc dự án) thiết lập và trả về đối tượng ứng dụng [`express()`](https://expressjs.com/en/api.html).
`require()` là [cách CommonJS](https://nodejs.org/api/modules.html) để import mã JavaScript, JSON và các tệp khác vào tệp hiện tại.
Ở đây chúng tôi chỉ định module **app.js** bằng đường dẫn tương đối và bỏ qua phần mở rộng tệp tùy chọn (.**js**).

```js
#!/usr/bin/env node

/**
 * Module dependencies.
 */

const app = require("../app");
```

> [!NOTE]
> Node.js 14 và các phiên bản sau hỗ trợ câu lệnh ES6 `import` để import các module JavaScript (ECMAScript).
> Để sử dụng tính năng này, bạn phải thêm `"type": "module"` vào tệp **package.json** Express của mình, tất cả các module trong ứng dụng của bạn phải sử dụng `import` thay vì `require()` và đối với _các import tương đối_ bạn phải bao gồm phần mở rộng tệp (để biết thêm thông tin xem [tài liệu Node](https://nodejs.org/api/esm.html#introduction)).
> Mặc dù có những lợi ích khi sử dụng `import`, hướng dẫn này sử dụng `require()` để phù hợp với [tài liệu Express](https://expressjs.com/en/starter/hello-world.html).

Phần còn lại của mã trong tệp này thiết lập máy chủ HTTP node với `app` được đặt thành một cổng cụ thể (được định nghĩa trong biến môi trường hoặc 3000 nếu biến không được định nghĩa) và bắt đầu lắng nghe và báo cáo lỗi máy chủ và kết nối. Bây giờ bạn thực sự không cần biết gì khác về mã (mọi thứ trong tệp này là "boilerplate"), nhưng hãy thoải mái xem lại nó nếu bạn quan tâm.

### app.js

Tệp này tạo đối tượng ứng dụng `express` (được đặt tên là `app`, theo quy ước), thiết lập ứng dụng với các cài đặt và middleware khác nhau và sau đó export ứng dụng từ module. Mã bên dưới chỉ hiển thị các phần của tệp tạo và export đối tượng ứng dụng:

```js
const express = require("express");

const app = express();
// …
module.exports = app;
```

Quay lại tệp điểm vào **www** ở trên, chính đối tượng `module.exports` này được cung cấp cho người gọi khi tệp này được import.

Hãy làm việc qua tệp **app.js** một cách chi tiết. Đầu tiên, chúng tôi import một số thư viện node hữu ích vào tệp bằng `require()`, bao gồm _http-errors_, _express_, _morgan_ và _cookie-parser_ mà chúng tôi đã tải xuống trước đó cho ứng dụng của mình bằng npm; và _path_, là thư viện Node cốt lõi để phân tích đường dẫn tệp và thư mục.

```js
const createError = require("http-errors");
const express = require("express");
const path = require("path");
const cookieParser = require("cookie-parser");
const logger = require("morgan");
```

Sau đó chúng tôi `require()` các module từ thư mục routes của chúng tôi. Các module/tệp này chứa mã để xử lý các tập hợp "route" (đường dẫn URL) liên quan cụ thể. Khi chúng tôi mở rộng ứng dụng khung, ví dụ để liệt kê tất cả sách trong thư viện, chúng tôi sẽ thêm tệp mới để xử lý các route liên quan đến sách.

```js
const indexRouter = require("./routes/index");
const usersRouter = require("./routes/users");
```

> [!NOTE]
> Tại thời điểm này, chúng tôi chỉ đã _import_ module; chúng tôi thực sự chưa sử dụng các route của nó (điều này xảy ra một chút sau trong tệp).

Tiếp theo, chúng tôi tạo đối tượng `app` bằng cách sử dụng module _express_ đã được import và sau đó sử dụng nó để thiết lập công cụ view (mẫu). Có hai phần để thiết lập công cụ. Đầu tiên, chúng tôi đặt giá trị `"views"` để chỉ định thư mục nơi các mẫu sẽ được lưu trữ (trong trường hợp này là thư mục con **/views**). Sau đó chúng tôi đặt giá trị `"view engine"` để chỉ định thư viện mẫu (trong trường hợp này "pug").

```js
const app = express();

// view engine setup
app.set("views", path.join(__dirname, "views"));
app.set("view engine", "pug");
```

Tập hợp hàm tiếp theo gọi `app.use()` để thêm các thư viện _middleware_ mà chúng tôi đã import ở trên vào chuỗi xử lý yêu cầu.
Ví dụ: `express.json()` và `express.urlencoded()` cần thiết để điền [`req.body`](https://expressjs.com/en/api.html#req.body) với các trường biểu mẫu.
Sau các thư viện này, chúng tôi cũng sử dụng middleware `express.static`, làm cho _Express_ phục vụ tất cả các tệp tĩnh trong thư mục **/public** trong thư mục gốc dự án.

```js
app.use(logger("dev"));
app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(cookieParser());

app.use(express.static(path.join(__dirname, "public")));
```

Bây giờ tất cả middleware khác đã được thiết lập, chúng tôi thêm mã xử lý route (được import trước đó) vào chuỗi xử lý yêu cầu. Mã được import sẽ định nghĩa các route cụ thể cho các _phần_ khác nhau của trang web:

```js
app.use("/", indexRouter);
app.use("/users", usersRouter);
```

> [!NOTE]
> Các đường dẫn được chỉ định ở trên (`"/"` và `"/users"`) được coi là tiền tố cho các route được định nghĩa trong các tệp được import.
> Vì vậy, ví dụ: nếu module **users** đã import định nghĩa route cho `/profile`, bạn sẽ truy cập route đó tại `/users/profile`. Chúng tôi sẽ nói thêm về route trong một bài viết sau.

Middleware cuối cùng trong tệp thêm các phương thức xử lý cho các lỗi và phản hồi HTTP 404.

```js
// catch 404 and forward to error handler
app.use((req, res, next) => {
  next(createError(404));
});

// error handler
app.use((err, req, res, next) => {
  // set locals, only providing error in development
  res.locals.message = err.message;
  res.locals.error = req.app.get("env") === "development" ? err : {};

  // render the error page
  res.status(err.status || 500);
  res.render("error");
});
```

Đối tượng ứng dụng Express (app) hiện đã được cấu hình đầy đủ. Bước cuối cùng là thêm nó vào các module exports (điều này cho phép nó được import bởi **/bin/www**).

```js
module.exports = app;
```

### Route

Tệp route **/routes/users.js** được hiển thị bên dưới (các tệp route có cấu trúc tương tự, vì vậy chúng tôi không cần hiển thị thêm **index.js**).
Đầu tiên, nó tải module _express_ và sử dụng nó để lấy đối tượng `express.Router`.
Sau đó nó chỉ định một route trên đối tượng đó và cuối cùng export bộ định tuyến từ module (điều này cho phép tệp được import vào **app.js**).

```js
const express = require("express");

const router = express.Router();

/* GET users listing. */
router.get("/", (req, res, next) => {
  res.send("respond with a resource");
});

module.exports = router;
```

Route định nghĩa một hàm gọi lại sẽ được gọi bất cứ khi nào phát hiện yêu cầu HTTP `GET` với mẫu đúng. Mẫu khớp là route được chỉ định khi module được import (`"/users"`) cộng với bất cứ điều gì được định nghĩa trong tệp này (`"/"`). Nói cách khác, route này sẽ được sử dụng khi nhận được URL `/users/`.

> [!NOTE]
> Hãy thử điều này bằng cách chạy máy chủ với node và truy cập URL trong trình duyệt của bạn: `http://localhost:3000/users/`. Bạn sẽ thấy thông báo: 'respond with a resource'.

Một điều thú vị ở trên là hàm gọi lại có đối số thứ ba `next` và do đó là hàm middleware thay vì hàm gọi lại route đơn giản. Mặc dù mã hiện tại không sử dụng đối số `next`, nhưng có thể hữu ích trong tương lai nếu bạn muốn thêm nhiều trình xử lý route vào đường dẫn route `'/'`.

### Views (mẫu)

Các views (mẫu) được lưu trữ trong thư mục **/views** (như được chỉ định trong **app.js**) và được cấp phần mở rộng tệp **.pug**. Phương thức [`Response.render()`](https://expressjs.com/en/5x/api.html#res.render) được sử dụng để render một mẫu được chỉ định cùng với các giá trị của các biến được đặt tên được truyền trong một đối tượng, và sau đó gửi kết quả như một phản hồi. Trong mã bên dưới từ **/routes/index.js**, bạn có thể thấy cách route đó render phản hồi bằng cách sử dụng mẫu "index" truyền biến mẫu "title".

```js
/* GET home page. */
router.get("/", (req, res, next) => {
  res.render("index", { title: "Express" });
});
```

Mẫu tương ứng cho route trên được cung cấp bên dưới (**index.pug**). Chúng tôi sẽ nói thêm về cú pháp sau. Tất cả những gì bạn cần biết bây giờ là biến `title` (với giá trị `'Express'`) được chèn vào nơi được chỉ định trong mẫu.

```pug
extends layout

block content
  h1= title
  p Welcome to #{title}
```

## Thử thách bản thân

Tạo một route mới trong **/routes/users.js** sẽ hiển thị văn bản "_You're so cool"_ tại URL `/users/cool/`. Kiểm tra bằng cách chạy máy chủ và truy cập `http://localhost:3000/users/cool/` trong trình duyệt của bạn

## Tóm tắt

Bây giờ bạn đã tạo dự án trang web khung cho [Thư viện cục bộ](/en-US/docs/Learn_web_development/Extensions/Server-side/Express_Nodejs/Tutorial_local_library_website) và xác minh rằng nó chạy bằng _node_. Quan trọng nhất, bạn cũng hiểu cấu trúc dự án, vì vậy bạn có ý tưởng tốt về nơi chúng tôi cần thực hiện thay đổi để thêm route và views cho thư viện cục bộ của chúng tôi.

Tiếp theo, chúng tôi sẽ bắt đầu sửa đổi khung để nó hoạt động như một trang web thư viện.

## Xem thêm

- [Trình tạo ứng dụng Express](https://expressjs.com/en/starter/generator.html) (Tài liệu Express)
- [Sử dụng công cụ mẫu với Express](https://expressjs.com/en/guide/using-template-engines.html) (Tài liệu Express)

{{PreviousMenuNext("Learn_web_development/Extensions/Server-side/Express_Nodejs/Tutorial_local_library_website", "Learn_web_development/Extensions/Server-side/Express_Nodejs/mongoose", "Learn_web_development/Extensions/Server-side/Express_Nodejs")}}
