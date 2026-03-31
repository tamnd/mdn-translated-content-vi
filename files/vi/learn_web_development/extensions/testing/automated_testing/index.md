---
title: Giới thiệu về kiểm thử tự động
short-title: Kiểm thử tự động
slug: Learn_web_development/Extensions/Testing/Automated_testing
page-type: learn-module-chapter
sidebar: learnsidebar
---

{{PreviousMenuNext("Learn_web_development/Extensions/Testing/Feature_detection", "Learn_web_development/Extensions/Testing/Your_own_automation_environment", "Learn_web_development/Extensions/Testing")}}

Chạy thủ công các bài kiểm thử trên nhiều trình duyệt và thiết bị, nhiều lần mỗi ngày, có thể trở nên tẻ nhạt và tốn thời gian. Để xử lý điều này hiệu quả, bạn nên quen thuộc với các công cụ tự động hóa. Trong bài viết này, chúng ta xem xét những gì có sẵn, cách sử dụng trình chạy tác vụ, và những điều cơ bản về cách sử dụng các ứng dụng kiểm thử đa trình duyệt thương mại như Sauce Labs, BrowserStack và TestingBot.

<table>
  <tbody>
    <tr>
      <th scope="row">Điều kiện tiên quyết:</th>
      <td>
        Quen thuộc với các ngôn ngữ cốt lõi <a href="/en-US/docs/Learn_web_development/Core/Structuring_content">HTML</a>, <a href="/en-US/docs/Learn_web_development/Core/Styling_basics">CSS</a>, và <a href="/en-US/docs/Learn_web_development/Core/Scripting">JavaScript</a>;
        có ý tưởng về các nguyên tắc cấp cao <a href="/en-US/docs/Learn_web_development/Extensions/Testing/Introduction">của kiểm thử đa trình duyệt</a>.
      </td>
    </tr>
    <tr>
      <th scope="row">Mục tiêu:</th>
      <td>
        Cung cấp hiểu biết về những gì kiểm thử tự động bao gồm, cách nó có thể giúp cuộc sống của bạn dễ dàng hơn, và cách sử dụng một số sản phẩm thương mại giúp mọi thứ dễ dàng hơn.
      </td>
    </tr>
  </tbody>
</table>

## Tự động hóa giúp mọi thứ dễ dàng

Trong suốt mô-đun này, chúng ta đã trình bày chi tiết nhiều cách khác nhau để kiểm thử trang web và ứng dụng, và giải thích loại phạm vi mà các nỗ lực kiểm thử đa trình duyệt của bạn nên có về các trình duyệt cần kiểm thử, các cân nhắc về khả năng truy cập, v.v. Nghe có vẻ như rất nhiều công việc phải không?

Chúng ta đồng ý — việc kiểm thử thủ công tất cả những gì chúng ta đã xem xét trong các bài viết trước có thể là nỗi đau thực sự. May mắn thay, có các công cụ để giúp chúng ta tự động hóa một phần nỗi đau đó. Có hai cách chính mà chúng ta có thể tự động hóa các bài kiểm thử chúng ta đã thảo luận trong mô-đun này:

1. Sử dụng trình chạy tác vụ như [Grunt](https://gruntjs.com/) hoặc [Gulp](https://gulpjs.com/), hoặc [npm scripts](https://docs.npmjs.com/misc/scripts/) để chạy kiểm thử và dọn dẹp mã trong quá trình xây dựng. Đây là cách tuyệt vời để thực hiện các tác vụ như kiểm tra mã và thu nhỏ, thêm tiền tố CSS hoặc chuyển đổi các tính năng JavaScript mới cho khả năng đa trình duyệt tối đa, v.v.
2. Sử dụng hệ thống tự động hóa trình duyệt như [Selenium](https://www.selenium.dev/) để chạy các bài kiểm thử cụ thể trên các trình duyệt được cài đặt và trả về kết quả, cảnh báo bạn về các lỗi trong trình duyệt khi chúng xuất hiện. Các ứng dụng kiểm thử đa trình duyệt thương mại như [Sauce Labs](https://saucelabs.com/) và [BrowserStack](https://www.browserstack.com/) được xây dựng dựa trên Selenium, nhưng cho phép bạn truy cập thiết lập của họ từ xa bằng giao diện, giúp bạn không phải tự thiết lập hệ thống kiểm thử.

Chúng ta sẽ xem xét cách thiết lập hệ thống kiểm thử dựa trên Selenium của riêng bạn trong bài viết tiếp theo. Trong bài viết này, chúng ta sẽ xem xét cách thiết lập trình chạy tác vụ và sử dụng chức năng cơ bản của các hệ thống thương mại như những hệ thống đã đề cập ở trên.

> [!NOTE]
> Hai danh mục trên không loại trừ nhau. Có thể thiết lập trình chạy tác vụ để truy cập dịch vụ như Sauce Labs qua API, chạy kiểm thử đa trình duyệt và trả về kết quả. Chúng ta cũng sẽ xem xét điều này bên dưới.

## Sử dụng trình chạy tác vụ để tự động hóa các công cụ kiểm thử

Như chúng ta đã nói ở trên, bạn có thể tăng tốc đáng kể các tác vụ phổ biến như kiểm tra mã và thu nhỏ bằng cách sử dụng trình chạy tác vụ để chạy tất cả những gì bạn cần chạy tự động tại một thời điểm nhất định trong quá trình xây dựng. Ví dụ, điều này có thể là mỗi khi bạn lưu tệp, hoặc tại một thời điểm khác. Trong phần này, chúng ta sẽ xem xét cách tự động hóa chạy tác vụ với Node và Gulp, một tùy chọn thân thiện với người mới bắt đầu.

### Thiết lập Node và npm

Hầu hết các công cụ ngày nay được dựa trên {{Glossary("Node.js")}}, vì vậy bạn sẽ cần cài đặt nó cùng với trình quản lý gói tương ứng của nó, [`npm`](https://www.npmjs.com/):

1. Cách dễ nhất để cài đặt và cập nhật Node.js và `npm` là thông qua trình quản lý phiên bản node: Làm theo hướng dẫn tại [Installing Node](/en-US/docs/Learn_web_development/Extensions/Server-side/Express_Nodejs/development_environment#installing_node) để làm điều đó.
2. Đảm bảo [kiểm tra rằng cài đặt của bạn thành công](/en-US/docs/Learn_web_development/Extensions/Server-side/Express_Nodejs/development_environment#testing_your_nodejs_and_npm_installation) trước khi tiếp tục.
3. Nếu bạn đã cài đặt Node.js/`npm` trước đó, bạn nên cập nhật chúng lên phiên bản mới nhất. Điều này có thể được thực hiện bằng cách sử dụng trình quản lý phiên bản node để cài đặt các phiên bản LTS mới nhất.

Để bắt đầu sử dụng các gói dựa trên Node/npm trong các dự án của bạn, bạn cần thiết lập thư mục dự án của mình như các dự án npm. Điều này dễ thực hiện.

Ví dụ, trước tiên hãy tạo thư mục kiểm thử để cho phép chúng ta thử mà không sợ phá vỡ bất cứ điều gì.

1. Tạo một thư mục mới ở nơi hợp lý bằng giao diện trình quản lý tệp, hoặc trên dòng lệnh, bằng cách điều hướng đến vị trí bạn muốn và chạy lệnh sau:

   ```bash
   mkdir node-test
   ```

2. Để làm cho thư mục này trở thành dự án npm, bạn chỉ cần vào thư mục kiểm thử và khởi tạo nó:

   ```bash
   cd node-test
   npm init
   ```

3. Lệnh thứ hai này sẽ hỏi bạn nhiều câu hỏi để tìm ra thông tin cần thiết để thiết lập dự án; bạn có thể chỉ cần chọn các giá trị mặc định bây giờ.
4. Khi tất cả các câu hỏi đã được hỏi, nó sẽ hỏi bạn nếu thông tin nhập vào có ổn không. Nhập `yes` và nhấn Enter/Return và npm sẽ tạo tệp `package.json` trong thư mục của bạn.

Tệp này về cơ bản là tệp cấu hình cho dự án. Bạn có thể tùy chỉnh nó sau, nhưng bây giờ nó sẽ trông giống như sau:

```json
{
  "name": "node-test",
  "version": "1.0.0",
  "description": "Test for npm projects",
  "main": "index.js",
  "scripts": {
    "test": "test"
  },
  "author": "Chris Mills",
  "license": "MIT"
}
```

Với điều này, bạn đã sẵn sàng tiếp tục.

### Thiết lập tự động hóa Gulp

Hãy xem xét cách thiết lập Gulp và sử dụng nó để tự động hóa một số công cụ kiểm thử.

1. Để bắt đầu, hãy tạo một dự án npm kiểm thử bằng quy trình được mô tả ở phần trước.
   Ngoài ra, cập nhật tệp `package.json` với dòng: `"type": "module"` để nó trông giống như sau:

   ```json
   {
     "name": "node-test",
     "version": "1.0.0",
     "description": "Test for npm projects",
     "main": "index.js",
     "scripts": {
       "test": "test"
     },
     "author": "Chris Mills",
     "license": "MIT",
     "type": "module"
   }
   ```

2. Tiếp theo, bạn cần một số nội dung HTML, CSS và JavaScript mẫu để kiểm thử hệ thống của bạn — tạo bản sao của các tệp mẫu [index.html](https://github.com/mdn/learning-area/blob/main/tools-testing/cross-browser-testing/automation/index.html), [main.js](https://github.com/mdn/learning-area/blob/main/tools-testing/cross-browser-testing/automation/main.js) và [style.css](https://github.com/mdn/learning-area/blob/main/tools-testing/cross-browser-testing/automation/style.css) trong thư mục con có tên `src` bên trong thư mục dự án của bạn.
3. Cài đặt gulp globally (nghĩa là, nó sẽ có sẵn trong tất cả các dự án) bằng lệnh sau:

   ```bash
   npm install --global gulp-cli
   ```

4. Tiếp theo, chạy lệnh sau bên trong thư mục gốc dự án npm của bạn để thiết lập gulp như một phụ thuộc của dự án:

   ```bash
   npm install --save-dev gulp
   ```

5. Bây giờ tạo một tệp mới bên trong thư mục dự án của bạn có tên `gulpfile.mjs`. Đây là tệp sẽ chạy tất cả các tác vụ của chúng ta. Bên trong tệp này, hãy đặt nội dung sau:

   ```js
   import gulp from "gulp";

   export default function (cb) {
     console.log("Gulp running");
     cb();
   }
   ```

   Điều này yêu cầu mô-đun `gulp` chúng ta đã cài đặt trước đó, sau đó xuất tác vụ mặc định không làm gì ngoài việc in thông báo vào terminal — điều này hữu ích để cho chúng ta biết Gulp đang hoạt động.

6. Bạn có thể chạy tác vụ mặc định của gulp với lệnh sau:

   ```bash
   gulp
   ```

### Thêm một số tác vụ thực sự vào Gulp

Để thêm tác vụ thực sự vào Gulp, chúng ta cần suy nghĩ về những gì chúng ta muốn làm. Một tập hợp chức năng cơ bản hợp lý để chạy trong dự án của chúng ta như sau:

- html-tidy, css-lint và js-hint để kiểm tra và báo cáo/sửa lỗi HTML/CSS/JS phổ biến (xem [gulp-htmltidy](https://www.npmjs.com/package/gulp-htmltidy), [gulp-csslint](https://www.npmjs.com/package/gulp-csslint), [gulp-jshint](https://www.npmjs.com/package/gulp-jshint)).
- Autoprefixer để quét CSS và thêm tiền tố nhà cung cấp chỉ khi cần thiết (xem [gulp-autoprefixer](https://www.npmjs.com/package/gulp-autoprefixer)).
- babel để chuyển đổi bất kỳ tính năng cú pháp JavaScript mới nào sang cú pháp truyền thống hoạt động trong các trình duyệt cũ hơn (xem [gulp-babel](https://www.npmjs.com/package/gulp-babel)).

Xem các liên kết trên để biết hướng dẫn đầy đủ về các gói gulp khác nhau chúng ta đang sử dụng.

Để sử dụng mỗi plugin, bạn cần cài đặt nó qua npm, sau đó yêu cầu bất kỳ phụ thuộc nào ở đầu tệp `gulpfile.mjs`, sau đó thêm các bài kiểm thử vào cuối nó, và cuối cùng xuất tên tác vụ của bạn để có sẵn qua lệnh gulp.

#### html-tidy

1. Cài đặt bằng dòng sau:

   ```bash
   npm install --save-dev gulp-htmltidy
   ```

2. Thêm phụ thuộc sau vào `gulpfile.mjs`:

   ```js
   import htmltidy from "gulp-htmltidy";
   ```

3. Thêm bài kiểm thử sau vào cuối `gulpfile.mjs`:

   ```js
   export function html() {
     return gulp
       .src("src/index.html")
       .pipe(htmltidy())
       .pipe(gulp.dest("build"));
   }
   ```

4. Thay đổi export mặc định thành:

   ```js
   export default html;
   ```

Ở đây chúng ta lấy tệp `index.html` phát triển bằng `gulp.src()`, cho phép chúng ta lấy tệp nguồn để làm gì đó với nó.

Chúng ta tiếp theo sử dụng hàm `pipe()` để truyền nguồn đó đến lệnh khác để làm gì đó khác. Chúng ta có thể xâu chuỗi bao nhiêu trong số chúng cùng nhau tùy thích. Đầu tiên chúng ta chạy `htmltidy()` trên nguồn, đi qua và sửa lỗi trong tệp của chúng ta. Hàm `pipe()` thứ hai ghi tệp HTML đầu ra vào thư mục `build`.

#### Autoprefixer và css-lint

1. Cài đặt bằng các dòng sau:

   ```bash
   npm install --save-dev gulp-autoprefixer
   npm install --save-dev gulp-csslint
   ```

2. Thêm các phụ thuộc sau vào `gulpfile.mjs`:

   ```js
   import autoprefixer from "gulp-autoprefixer";
   import csslint from "gulp-csslint";
   ```

3. Thêm bài kiểm thử sau vào cuối `gulpfile.mjs`:

   ```js
   export function css() {
     return gulp
       .src("src/style.css")
       .pipe(csslint())
       .pipe(csslint.formatter("compact"))
       .pipe(
         autoprefixer({
           cascade: false,
         }),
       )
       .pipe(gulp.dest("build"));
   }
   ```

4. Thêm thuộc tính sau vào `package.json`:

   ```json
   {
     "browserslist": ["last 5 versions"]
   }
   ```

5. Thay đổi tác vụ mặc định thành:

   ```js
   export default gulp.series(html, css);
   ```

Ở đây chúng ta lấy tệp `style.css`, chạy csslint trên đó (xuất danh sách bất kỳ lỗi nào trong CSS vào terminal), sau đó chạy nó qua autoprefixer để thêm bất kỳ tiền tố nào cần thiết để làm cho các tính năng CSS mới chạy trong các trình duyệt cũ hơn. Ở cuối chuỗi pipe, chúng ta xuất CSS đã được sửa đổi sang thư mục `build`.

#### js-hint và babel

1. Cài đặt bằng các dòng sau:

   ```bash
   npm install --save-dev gulp-babel @babel/preset-env
   npm install --save-dev @babel/core
   npm install jshint gulp-jshint --save-dev
   ```

2. Thêm các phụ thuộc sau vào `gulpfile.mjs`:

   ```js
   import babel from "gulp-babel";
   import jshint from "gulp-jshint";
   ```

3. Thêm bài kiểm thử sau vào cuối `gulpfile.mjs`:

   ```js
   export function js() {
     return gulp
       .src("src/main.js")
       .pipe(jshint())
       .pipe(jshint.reporter("default"))
       .pipe(
         babel({
           presets: ["@babel/env"],
         }),
       )
       .pipe(gulp.dest("build"));
   }
   ```

4. Thay đổi tác vụ mặc định thành:

   ```js
   export default gulp.series(html, css, js);
   ```

Ở đây chúng ta lấy tệp `main.js`, chạy `jshint` trên đó và xuất kết quả ra terminal bằng `jshint.reporter`; sau đó chúng ta truyền tệp vào babel, chuyển đổi nó sang cú pháp kiểu cũ và xuất kết quả vào thư mục `build`.

#### Các ý tưởng thêm

Khi tất cả đã được thiết lập, bạn có thể chạy lệnh `gulp` bên trong thư mục dự án của mình, và bạn sẽ nhận được đầu ra tổng hợp.

Gulp cũng có hàm `watch()` mà bạn có thể sử dụng để theo dõi tệp và chạy kiểm thử mỗi khi bạn lưu tệp. Ví dụ, hãy thử thêm nội dung sau vào cuối `gulpfile.mjs`:

```js
export function watch() {
  gulp.watch("src/*.html", html);
  gulp.watch("src/*.css", css);
  gulp.watch("src/*.js", js);
}
```

Bây giờ hãy thử nhập lệnh `gulp watch` vào terminal của bạn. Gulp bây giờ sẽ theo dõi thư mục của bạn và chạy các tác vụ thích hợp mỗi khi bạn lưu thay đổi vào tệp HTML, CSS hoặc JavaScript.

> [!NOTE]
> Ký tự `*` là ký tự đại diện — ở đây chúng ta đang nói "chạy các tác vụ này khi bất kỳ tệp nào của các loại này được lưu". Bạn cũng có thể sử dụng ký tự đại diện trong các tác vụ chính của mình, ví dụ `gulp.src('src/*.css')` sẽ lấy tất cả các tệp CSS của bạn và sau đó chạy các tác vụ được nối trên chúng.

Có rất nhiều thứ khác bạn có thể làm với Gulp. [Thư mục plugin Gulp](https://gulpjs.com/plugins/) có hàng nghìn plugin để tìm kiếm.

### Các trình chạy tác vụ khác

Có nhiều trình chạy tác vụ khác có sẵn. Chúng ta chắc chắn không cố gắng nói rằng Gulp là giải pháp tốt nhất, nhưng nó hoạt động với chúng ta và khá dễ tiếp cận với người mới bắt đầu. Bạn cũng có thể thử sử dụng các giải pháp khác:

- Grunt hoạt động theo cách rất giống Gulp, ngoại trừ nó dựa vào các tác vụ được chỉ định trong tệp cấu hình, thay vì sử dụng JavaScript đã viết. Xem [Getting started with Grunt để biết thêm chi tiết.](https://gruntjs.com/getting-started)
- Bạn cũng có thể chạy tác vụ trực tiếp bằng cách sử dụng npm scripts nằm bên trong tệp `package.json` của bạn, mà không cần cài đặt bất kỳ loại hệ thống trình chạy tác vụ bổ sung nào. [Why npm scripts?](https://css-tricks.com/why-npm-scripts/) cung cấp giới thiệu tốt với nhiều thông tin thêm.

## Sử dụng các dịch vụ kiểm thử thương mại để tăng tốc kiểm thử trình duyệt

Bây giờ hãy xem xét các dịch vụ kiểm thử trình duyệt bên thứ ba thương mại và những gì chúng có thể làm cho chúng ta.

Khi bạn sử dụng các loại dịch vụ này, bạn cung cấp URL của trang bạn muốn kiểm thử cùng với thông tin, chẳng hạn như các trình duyệt bạn muốn nó được kiểm thử. Ứng dụng sau đó cấu hình VM mới với hệ điều hành và trình duyệt bạn đã chỉ định, và trả về kết quả kiểm thử dưới dạng ảnh chụp màn hình, video, tệp nhật ký, văn bản, v.v. Điều này rất hữu ích và thuận tiện hơn nhiều so với việc tự thiết lập tất cả các kết hợp hệ điều hành/trình duyệt.

Sau đó bạn có thể tăng tốc, sử dụng API để truy cập chức năng theo chương trình, có nghĩa là các ứng dụng như vậy có thể được kết hợp với trình chạy tác vụ, chẳng hạn như môi trường Selenium cục bộ của riêng bạn và các môi trường khác, để tạo các bài kiểm thử tự động.

> [!NOTE]
> Có các hệ thống kiểm thử trình duyệt thương mại khác có sẵn nhưng trong bài viết này, chúng ta sẽ tập trung vào BrowserStack, Sauce Labs và TestingBot. Chúng ta không nói rằng đây nhất thiết là các công cụ tốt nhất có sẵn, nhưng chúng là công cụ tốt đơn giản để người mới bắt đầu sử dụng.

### BrowserStack

#### Bắt đầu với BrowserStack

Để bắt đầu:

1. Tạo [tài khoản dùng thử BrowserStack](https://www.browserstack.com/users/sign_up).
2. Đăng nhập. Điều này sẽ xảy ra tự động sau khi bạn xác minh địa chỉ email.
3. Nhấp vào liên kết _Live_ trong menu điều hướng trên cùng để đến Live Manual Testing.

#### Cơ bản: Kiểm thử thủ công

Bảng điều khiển BrowserStack Live cho phép bạn chọn nền tảng, thiết bị và trình duyệt bạn muốn kiểm thử.
Đối với kiểm thử máy tính để bàn, bạn chọn hệ điều hành và trình duyệt trực tiếp.
Đối với thiết bị di động, bạn chọn hệ điều hành di động, thiết bị, sau đó bạn có thể chọn trình duyệt cho kết hợp thiết bị-trình duyệt.

Nhấp vào một trong các biểu tượng trình duyệt đó sẽ tải nền tảng, thiết bị và trình duyệt bạn đã chọn — chọn một cái bây giờ và thử xem.

Bạn có thể nhập URL vào thanh địa chỉ, cuộn lên xuống bằng cách kéo bằng chuột và sử dụng các cử chỉ phù hợp (ví dụ, kẹp/thu phóng, hai ngón tay để cuộn) trên touchpad của các thiết bị hỗ trợ như MacBook.

Các tính năng có sẵn thay đổi tùy thuộc vào trình duyệt nào được tải, và có thể bao gồm các điều khiển cho:

- Hiển thị thông tin về trình duyệt hiện tại
- Chuyển sang các trình duyệt khác
- Kiểm thử URL localhost
- Đặt mức thu phóng và chuyển đổi hướng
- Lưu và tải dấu trang
- Chụp/chú thích ảnh chụp màn hình và nộp báo cáo lỗi
- Truy cập DevTools trình duyệt
- Thay đổi vị trí được báo cáo
- Điều chỉnh mạng
- Truy cập trình đọc màn hình

Để biết thêm thông tin, xem tài liệu [BrowserStack Live](https://www.browserstack.com/docs/live).

#### Nâng cao: BrowserStack API

BrowserStack cũng có [RESTful API](https://www.browserstack.com/docs/automate/api-reference/selenium/introduction) cho phép bạn lấy chi tiết theo chương trình về kế hoạch tài khoản, phiên, các bản dựng, v.v.

Hãy xem nhanh cách chúng ta sẽ truy cập API bằng Node.js.

1. Đầu tiên, thiết lập một dự án npm mới để kiểm thử điều này, như được mô tả trong [Thiết lập Node và npm](#setting_up_node_and_npm). Sử dụng tên thư mục khác so với trước đây, như `bstack-test` chẳng hạn.
2. Tạo tệp mới bên trong thư mục gốc dự án của bạn gọi là `call_bstack.js` và đặt cho nó nội dung sau:

   ```js
   const axios = require("axios");

   const bsUser = "BROWSERSTACK_USERNAME";
   const bsKey = "BROWSERSTACK_ACCESS_KEY";
   const baseUrl = `https://${bsUser}:${bsKey}@www.browserstack.com/automate/`;

   function getPlanDetails() {
     axios.get(`${baseUrl}plan.json`).then((response) => {
       console.log(response.data);
     });
     /* Response:
       {
         automate_plan: <string>,
         terminal_access: <string>.
         parallel_sessions_running: <int>,
         team_parallel_sessions_max_allowed: <int>,
         parallel_sessions_max_allowed: <int>,
         queued_sessions: <int>,
         queued_sessions_max_allowed: <int>
       }
       */
   }

   getPlanDetails();
   ```

3. Thay thế các chỗ giữ tên người dùng BrowserStack và khóa truy cập bằng các giá trị thực của bạn. Chúng có thể được truy xuất từ [BrowserStack Account & Profile Details](https://www.browserstack.com/accounts/profile/details), trong phần _Authentication & Security_.
4. Cài đặt mô-đun [axios](https://www.npmjs.com/package/axios):

   ```bash
   npm install axios
   ```

5. Đảm bảo tệp JavaScript của bạn được lưu và chạy nó:

   ```bash
   node call_bstack
   ```

Dưới đây chúng ta cũng cung cấp một số hàm làm sẵn khác mà bạn có thể thấy hữu ích khi làm việc với BrowserStack RESTful API.

Hàm này trả về chi tiết tóm tắt của tất cả các bản dựng tự động được tạo trước đó:

```js
function getBuilds() {
  axios.get(`${baseUrl}builds.json`).then((response) => {
    console.log(response.data);
  });

  /* Response:
  [
    {
      automation_build: {
        name: <string>,
        hashed_id: <string>,
        duration: <int>,
        status: <string>,
        build_tag: <string>,
        public_url: <string>
      }
    },
    // …
  ]
  */
}
```

Hàm này trả về chi tiết về các phiên cụ thể cho một bản dựng cụ thể:

```js
function getSessionsInBuild(build) {
  const buildId = build.automation_build.hashed_id;
  axios.get(`${baseUrl}builds/${buildId}/sessions.json`).then((response) => {
    console.log(response.data);
  });
  /* Response: [...] */
}
```

Hàm sau trả về chi tiết cho một phiên cụ thể:

```js
function getSessionDetails(session) {
  const sessionId = session.automation_session.hashed_id;
  axios.get(`${baseUrl}sessions/${sessionId}.json`).then((response) => {
    console.log(response.data);
  });
  /* Response: {...} */
}
```

#### Nâng cao: Kiểm thử tự động

Chúng ta sẽ đề cập đến [chạy kiểm thử BrowserStack tự động](/en-US/docs/Learn_web_development/Extensions/Testing/Your_own_automation_environment#browserstack) trong bài viết tiếp theo.

### Sauce Labs

#### Bắt đầu với Sauce Labs

Hãy bắt đầu với Sauce Labs Trial.

1. Tạo tài khoản dùng thử Sauce Labs.
2. Đăng nhập. Điều này sẽ xảy ra tự động sau khi bạn xác minh địa chỉ email.

#### Cơ bản: Kiểm thử thủ công

[Bảng điều khiển Sauce Labs](https://app.saucelabs.com/dashboard/manual) có nhiều tùy chọn. Khi đăng nhập, làm theo hướng dẫn 'Getting started':

1. Trong "Run your first test", nhấp _Desktop browser_.
2. Trong màn hình tiếp theo, nhập URL trang bạn muốn kiểm thử, sau đó chọn kết hợp trình duyệt/hệ điều hành bạn muốn kiểm thử bằng các nút và danh sách khác nhau.
3. Khi bạn bắt đầu kiểm thử, màn hình tải sẽ xuất hiện, và môi trường khởi động chạy kết hợp thiết bị/trình duyệt bạn đã chọn.
   Sau đó bạn có thể bắt đầu kiểm thử từ xa trang web đang chạy trong trình duyệt đã chọn.

Bạn có thể làm khá nhiều tại thời điểm này, như chia sẻ URL kiểm thử để người khác có thể quan sát kiểm thử từ xa, sao chép văn bản/ghi chú vào clipboard từ xa, chụp ảnh màn hình, kiểm thử ở chế độ toàn màn hình, v.v.

Khi bạn dừng phiên, bạn sẽ quay lại tab _Live_, nơi bạn sẽ thấy mục nhập cho mỗi phiên thủ công trước đó bạn đã bắt đầu.
Nhấp vào một trong những mục nhập này sẽ hiển thị thêm dữ liệu cho phiên.
Tại đây, bạn có thể tải xuống bất kỳ ảnh chụp màn hình nào bạn đã chụp, xem video của phiên, xem nhật ký dữ liệu, v.v.

Để biết thêm thông tin, xem [tài liệu Sauce Labs](https://docs.saucelabs.com/).

#### Nâng cao: Sauce Labs API

Sauce Labs có [RESTful API](https://docs.saucelabs.com/dev/api/) cho phép bạn lấy chi tiết theo chương trình về tài khoản và kiểm thử hiện có, và chú thích kiểm thử với chi tiết bổ sung.

Hãy xem nhanh cách chúng ta sẽ truy cập API bằng Node.js và [node-saucelabs](https://github.com/saucelabs/node-saucelabs).

1. Đầu tiên, thiết lập dự án npm mới, như được mô tả trong [Thiết lập Node và npm](#setting_up_node_and_npm). Sử dụng tên thư mục khác, như `sauce-test` chẳng hạn.
2. Cài đặt trình bao bọc Node Sauce Labs:

   ```bash
   npm install saucelabs
   ```

3. Tạo tệp mới bên trong thư mục gốc dự án của bạn gọi là `call_sauce.js`. Đặt cho nó nội dung sau:

   ```js
   const SauceLabs = require("saucelabs").default;

   (async () => {
     const myAccount = new SauceLabs({
       username: "your-sauce-username",
       password: "your-sauce-api-key",
     });

     // Get full WebDriver URL from the client depending on region:
     console.log(myAccount.webdriverEndpoint);

     // Get job details of last run job
     const jobs = await myAccount.listJobs("your-sauce-username", {
       limit: 1,
       full: true,
     });

     console.log(jobs);
   })();
   ```

4. Điền tên người dùng và khóa API Sauce Labs của bạn vào các vị trí được chỉ định. Chúng có thể được truy xuất từ trang [User Settings](https://app.saucelabs.com/user-settings) của bạn.
5. Đảm bảo mọi thứ đã được lưu và chạy tệp của bạn:

   ```bash
   node call_sauce
   ```

#### Nâng cao: Kiểm thử tự động

Chúng ta sẽ đề cập đến việc thực sự chạy kiểm thử Sauce Lab tự động trong bài viết tiếp theo.

### TestingBot

#### Bắt đầu với TestingBot

Hãy bắt đầu với TestingBot Trial.

1. Tạo [tài khoản dùng thử TestingBot](https://testingbot.com/users/sign_up).
2. Đăng nhập. Điều này sẽ xảy ra tự động sau khi bạn xác minh địa chỉ email.

#### Cơ bản: Kiểm thử thủ công

[Bảng điều khiển TestingBot](https://testingbot.com/members) liệt kê các tùy chọn khác nhau bạn có thể chọn. Hiện tại, hãy đảm bảo bạn đang ở tab _Live Web Testing_.

1. Nhập URL trang bạn muốn kiểm thử.
2. Chọn kết hợp trình duyệt/hệ điều hành bạn muốn kiểm thử bằng cách chọn kết hợp trong lưới.
3. Khi bạn nhấp _Start Browser_, màn hình tải sẽ xuất hiện, khởi động máy ảo chạy kết hợp bạn đã chọn.
4. Khi tải xong, bạn có thể bắt đầu kiểm thử từ xa trang web đang chạy trong trình duyệt đã chọn.
5. Từ đây bạn có thể thấy bố cục như nó trông trong trình duyệt bạn đang kiểm thử, di chuyển chuột xung quanh và thử nhấp nút, v.v. Menu bên cạnh cho phép bạn:
   - Dừng phiên
   - Thay đổi độ phân giải màn hình
   - Sao chép văn bản/ghi chú vào clipboard từ xa
   - Chụp, chỉnh sửa và tải xuống ảnh chụp màn hình
   - Kiểm thử ở chế độ toàn màn hình.

Khi bạn dừng phiên, bạn sẽ quay lại trang _Live Web Testing_, nơi bạn sẽ thấy mục nhập cho mỗi phiên thủ công trước đó. Nhấp vào một trong những mục nhập này sẽ hiển thị thêm dữ liệu cho phiên.

#### Nâng cao: TestingBot API

TestingBot có [RESTful API](https://testingbot.com/support/api) cho phép bạn lấy chi tiết theo chương trình về tài khoản và kiểm thử hiện có.

Dưới đây là ví dụ về cách tương tác với TestingBot API với client NodeJS [testingbot-api](https://www.npmjs.com/package/testingbot-api).

1. Đầu tiên, thiết lập dự án npm mới, như được mô tả trong [Thiết lập Node và npm](#setting_up_node_and_npm). Sử dụng tên thư mục khác, như `tb-test` chẳng hạn.
2. Cài đặt trình bao bọc Node TestingBot:

   ```bash
   npm install testingbot-api
   ```

3. Tạo tệp mới bên trong thư mục gốc dự án của bạn gọi là `tb.js`. Đặt cho nó nội dung sau:

   ```js
   const TestingBot = require("testingbot-api");

   let tb = new TestingBot({
     api_key: "your-tb-key",
     api_secret: "your-tb-secret",
   });

   tb.getTests((err, tests) => {
     console.log(tests);
   });
   ```

4. Điền Khóa và Bí mật TestingBot của bạn vào các vị trí được chỉ định. Bạn có thể tìm thấy chúng trong [bảng điều khiển TestingBot](https://testingbot.com/members/user/edit).
5. Đảm bảo mọi thứ đã được lưu và chạy tệp:

   ```bash
   node tb.js
   ```

#### Nâng cao: Kiểm thử tự động

Chúng ta sẽ đề cập đến việc thực sự chạy kiểm thử TestingBot tự động trong bài viết tiếp theo.

## Tóm tắt

Đây là chuyến đi khá thú vị, nhưng tôi chắc bạn có thể bắt đầu thấy lợi ích của việc sử dụng các công cụ tự động hóa để thực hiện một số công việc nặng nề về kiểm thử.

Trong bài viết tiếp theo, chúng ta sẽ xem xét cách thiết lập hệ thống tự động hóa cục bộ của riêng chúng ta bằng Selenium, và cách kết hợp điều đó với các dịch vụ như Sauce Labs, BrowserStack và TestingBot.

{{PreviousMenuNext("Learn_web_development/Extensions/Testing/Feature_detection", "Learn_web_development/Extensions/Testing/Your_own_automation_environment", "Learn_web_development/Extensions/Testing")}}
