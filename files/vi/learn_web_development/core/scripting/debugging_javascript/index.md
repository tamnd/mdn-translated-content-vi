---
title: Gỡ lỗi và xử lý lỗi JavaScript
short-title: Gỡ lỗi và xử lý lỗi
slug: Learn_web_development/Core/Scripting/Debugging_JavaScript
page-type: learn-module-chapter
sidebar: learnsidebar
---

{{PreviousMenuNext("Learn_web_development/Core/Scripting/House_data_UI","Learn_web_development/Core/Frameworks_libraries", "Learn_web_development/Core/Scripting")}}

Trong bài học này, chúng ta sẽ quay lại chủ đề gỡ lỗi JavaScript (mà chúng ta đã đề cập lần đầu trong [What went wrong?](/en-US/docs/Learn_web_development/Core/Scripting/What_went_wrong)). Ở đây chúng ta sẽ đi sâu hơn vào các kỹ thuật theo dõi lỗi và giải thích cách viết mã một cách phòng thủ và xử lý lỗi trong mã của bạn, tránh sự cố ngay từ đầu.

<table>
  <tbody>
    <tr>
      <th scope="row">Điều kiện tiên quyết:</th>
      <td>Hiểu biết về <a href="/en-US/docs/Learn_web_development/Core/Structuring_content">HTML</a> và <a href="/en-US/docs/Learn_web_development/Core/Styling_basics">kiến thức cơ bản về CSS</a>, quen thuộc với kiến thức cơ bản về JavaScript như đã trình bày trong các bài học trước.</td>
    </tr>
    <tr>
      <th scope="row">Kết quả học tập:</th>
      <td>
        <ul>
          <li>Sử dụng công cụ dành cho nhà phát triển trình duyệt để kiểm tra JavaScript chạy trên trang của bạn và xem lỗi nó đang tạo ra.</li>
          <li>Sử dụng <code>console.log()</code> và <code>console.error()</code> để gỡ lỗi.</li>
          <li>Gỡ lỗi JavaScript nâng cao với devtools trình duyệt.</li>
          <li>Xử lý lỗi với <code>conditionals</code>, <code>try...catch</code>, và <code>throw</code>.</li>
        </ul>
      </td>
    </tr>
  </tbody>
</table>

## Tóm tắt về các loại lỗi JavaScript

Trước đó trong module, trong [What went wrong?](/en-US/docs/Learn_web_development/Core/Scripting/What_went_wrong), chúng ta đã xem xét rộng rãi các loại lỗi có thể xảy ra trong các chương trình JavaScript, và nói rằng chúng có thể được phân tách thô thành hai loại — lỗi cú pháp và lỗi logic. Chúng ta cũng đã giúp bạn hiểu ý nghĩa của một số loại thông báo lỗi JavaScript phổ biến và cho bạn thấy cách thực hiện một số gỡ lỗi đơn giản bằng các câu lệnh [`console.log()`](/en-US/docs/Web/API/console/log_static).

Trong bài viết này, chúng ta sẽ xem xét sâu hơn các công cụ có sẵn để theo dõi lỗi, và cũng xem xét các cách để ngăn chặn lỗi ngay từ đầu.

## Kiểm tra mã của bạn

Bạn nên xác thực mã của mình trước khi cố gắng theo dõi các lỗi cụ thể. Hãy sử dụng [Dịch vụ xác thực đánh dấu](https://validator.w3.org/) của W3C, [Dịch vụ xác thực CSS](https://jigsaw.w3.org/css-validator/), và trình kiểm tra JavaScript như [ESLint](https://eslint.org/play/) để đảm bảo mã của bạn hợp lệ. Điều này có thể sẽ tiết lộ một số lỗi, mà bạn có thể sửa, cho phép bạn tập trung vào các lỗi còn lại.

### Plugin trình soạn thảo mã

Không thuận tiện khi phải sao chép và dán mã của bạn vào trang web để kiểm tra tính hợp lệ của nó nhiều lần. Chúng tôi khuyên bạn nên cài đặt plugin kiểm tra trong trình soạn thảo mã của bạn, để báo cáo lỗi khi bạn viết mã. Hãy thử tìm kiếm ESLint trong danh sách plugin hoặc tiện ích mở rộng của trình soạn thảo mã và cài đặt nó.

## Các vấn đề JavaScript phổ biến

Có một số vấn đề JavaScript phổ biến mà bạn sẽ muốn chú ý, chẳng hạn:

- Các vấn đề cú pháp và logic cơ bản (một lần nữa, hãy xem [Troubleshooting JavaScript](/en-US/docs/Learn_web_development/Core/Scripting/What_went_wrong)).
- Đảm bảo các biến, v.v. được định nghĩa trong phạm vi đúng, và bạn không gặp xung đột giữa các mục được khai báo ở các nơi khác nhau (xem [Phạm vi hàm và xung đột](/en-US/docs/Learn_web_development/Core/Scripting/Functions#function_scope_and_conflicts)).
- Nhầm lẫn về [`this`](/en-US/docs/Web/JavaScript/Reference/Operators/this), về mặt phạm vi nào nó áp dụng, và do đó nếu giá trị của nó là những gì bạn có ý định. Bạn có thể đọc [What is "this"?](/en-US/docs/Learn_web_development/Core/Scripting/Object_basics#what_is_this) để được giới thiệu nhẹ nhàng; bạn cũng nên nghiên cứu các ví dụ như [cái này](https://github.com/mdn/learning-area/blob/7ed039d17e820c93cafaff541aa65d874dde8323/javascript/oojs/assessment/main.js#L143), hiển thị mẫu điển hình của việc lưu phạm vi `this` vào một biến riêng biệt, sau đó sử dụng biến đó trong các hàm lồng nhau để bạn có thể chắc chắn bạn đang áp dụng chức năng cho phạm vi `this` đúng.
- Sử dụng không đúng các hàm bên trong vòng lặp lặp qua biến toàn cục (nói chung hơn, "đặt phạm vi sai").

> [!CALLOUT]
> Ví dụ, trong [bad-for-loop.html](https://mdn.github.io/learning-area/tools-testing/cross-browser-testing/javascript/bad-for-loop.html) (xem [mã nguồn](https://github.com/mdn/learning-area/blob/main/tools-testing/cross-browser-testing/javascript/bad-for-loop.html)), chúng ta lặp qua 10 lần lặp bằng cách sử dụng biến được định nghĩa bằng `var`, mỗi lần tạo một đoạn văn và thêm trình xử lý sự kiện [onclick](/en-US/docs/Web/API/Element/click_event) vào nó. Khi được nhấp, chúng ta muốn mỗi cái hiển thị thông báo cảnh báo chứa số của nó (giá trị của `i` tại thời điểm nó được tạo). Thay vào đó, tất cả chúng báo cáo `i` là 11 — vì vòng lặp `for` thực hiện tất cả các lần lặp của nó trước khi các hàm lồng nhau được gọi.
>
> Giải pháp dễ nhất là khai báo biến lặp với `let` thay vì `var` — giá trị của `i` liên kết với hàm thì duy nhất cho mỗi lần lặp. Xem [good-for-loop.html](https://mdn.github.io/learning-area/tools-testing/cross-browser-testing/javascript/good-for-loop.html) (xem [mã nguồn](https://github.com/mdn/learning-area/blob/main/tools-testing/cross-browser-testing/javascript/good-for-loop.html) cũng vậy) để biết phiên bản hoạt động.

- Đảm bảo [các hoạt động bất đồng bộ](/en-US/docs/Learn_web_development/Extensions/Async_JS) đã hoàn thành trước khi cố gắng sử dụng các giá trị chúng trả về. Điều này thường có nghĩa là hiểu cách sử dụng _promises_: sử dụng [`await`](/en-US/docs/Web/JavaScript/Reference/Operators/await) một cách thích hợp hoặc chạy mã để xử lý kết quả của lời gọi bất đồng bộ trong trình xử lý {{jsxref("Promise.then()", "then()")}} của promise. Xem [How to use promises](/en-US/docs/Learn_web_development/Extensions/Async_JS/Promises) để được giới thiệu về chủ đề này.

> [!NOTE]
> [Buggy JavaScript Code: The 10 Most Common Mistakes JavaScript Developers Make](https://www.toptal.com/developers/javascript/10-most-common-javascript-mistakes) có một số thảo luận tốt về những lỗi phổ biến này và nhiều hơn nữa.

## Bảng điều khiển JavaScript của trình duyệt

Công cụ dành cho nhà phát triển trình duyệt có nhiều tính năng hữu ích để gỡ lỗi JavaScript. Để bắt đầu, bảng điều khiển JavaScript sẽ báo cáo lỗi trong mã của bạn.

Tạo bản sao cục bộ của ví dụ [fetch-broken](https://mdn.github.io/learning-area/tools-testing/cross-browser-testing/javascript/fetch-broken/) của chúng ta (xem [mã nguồn](https://github.com/mdn/learning-area/tree/main/tools-testing/cross-browser-testing/javascript/fetch-broken) cũng vậy).

Nếu bạn nhìn vào bảng điều khiển, bạn sẽ thấy thông báo lỗi. Cách diễn đạt chính xác phụ thuộc vào trình duyệt, nhưng sẽ là gì đó như: "Uncaught TypeError: heroes is not iterable", và số dòng được tham chiếu là 25. Nếu chúng ta nhìn vào mã nguồn, phần mã liên quan là:

```js
function showHeroes(jsonObj) {
  const heroes = jsonObj["members"];

  for (const hero of heroes) {
    // …
  }
}
```

Vì vậy mã bị hỏng ngay khi chúng ta cố gắng sử dụng `jsonObj` (mà, như bạn có thể mong đợi, được cho là [đối tượng JSON](/en-US/docs/Learn_web_development/Core/Scripting/JSON)). Điều này được cho là được tải về từ tệp `.json` bên ngoài bằng cách sử dụng lời gọi {{domxref("Window/fetch", "fetch()")}} sau:

```js
const requestURL =
  "https://mdn.github.io/learning-area/javascript/oojs/json/superheroes.json";

const response = fetch(requestURL);
populateHeader(response);
showHeroes(response);
```

Tuy nhiên, điều này thất bại.

## Console API

Bạn có thể đã biết điều gì sai với mã này, nhưng hãy xem cách bạn có thể điều tra nó. Chúng ta sẽ bắt đầu với [Console](/en-US/docs/Web/API/console) API, cho phép mã JavaScript tương tác với bảng điều khiển JavaScript của trình duyệt. Nó có một số tính năng có sẵn; bạn đã gặp [`console.log()`](/en-US/docs/Web/API/console/log_static), in thông báo tùy chỉnh vào bảng điều khiển.

Hãy thử thêm lời gọi `console.log()` để ghi lại giá trị trả về của `fetch()`, như thế này:

```js
const requestURL =
  "https://mdn.github.io/learning-area/javascript/oojs/json/superheroes.json";

const response = fetch(requestURL);
console.log(`Response value: ${response}`);
populateHeader(response);
showHeroes(response);
```

Làm mới trang trong trình duyệt. Lần này, trước thông báo lỗi, bạn sẽ thấy một thông báo mới được ghi vào bảng điều khiển:

```plain
Response value: [object Promise]
```

Đầu ra `console.log()` cho thấy rằng giá trị trả về của `fetch()` không phải là dữ liệu JSON, mà là {{jsxref("Promise")}}. Hàm `fetch()` là bất đồng bộ: nó trả về `Promise` chỉ được thực hiện khi phản hồi thực tế đã được nhận từ mạng. Trước khi chúng ta có thể sử dụng phản hồi, chúng ta phải chờ `Promise` được thực hiện.

### `console.error()` và ngăn xếp lời gọi

Như một sự lạc đề ngắn, hãy thử sử dụng phương thức bảng điều khiển khác để báo cáo lỗi — {{domxref("console.error_static", "console.error()")}}. Trong mã của bạn, hãy thay thế

```js
console.log(`Response value: ${response}`);
```

bằng

```js
console.error(`Response value: ${response}`);
```

Lưu mã của bạn và làm mới trình duyệt; bây giờ bạn sẽ thấy thông báo được báo cáo là lỗi, với cùng màu sắc và biểu tượng như lỗi chưa bắt được bên dưới nó. Ngoài ra, bạn sẽ thấy mũi tên mở rộng/thu gọi bên cạnh thông báo. Nếu bạn nhấn vào đó, bạn sẽ thấy một dòng đơn chỉ ra dòng trong tệp JavaScript nơi lỗi bắt nguồn. Thực ra, dòng lỗi chưa bắt được _cũng_ có điều này, nhưng nó có hai dòng:

```plain
showHeroes http://localhost:7800/js-debug-test/index.js:25
<anonymous> http://localhost:7800/js-debug-test/index.js:10
```

Điều này có nghĩa là lỗi được gây ra bởi hàm `showHeroes()`, dòng 25, như chúng ta đã ghi nhận trước đó. Nếu bạn nhìn vào mã, bạn sẽ thấy rằng lời gọi ẩn danh trên dòng 10 đang gọi `showHeroes()`. Các dòng này được gọi là **ngăn xếp lời gọi**, và có thể thực sự hữu ích khi cố gắng theo dõi nguồn gốc của lỗi liên quan đến nhiều vị trí khác nhau trong mã của bạn.

Lời gọi `console.error()` không đặc biệt hữu ích trong trường hợp này, nhưng nó có thể hữu ích để tạo ngăn xếp lời gọi nếu ngăn xếp chưa có sẵn.

### Sửa lỗi

Dù sao, hãy quay lại cố gắng sửa lỗi của chúng ta. Chúng ta có thể truy cập phản hồi từ `Promise` đã thực hiện bằng cách chuỗi phương thức {{jsxref("Promise.prototype.then()", "then()")}} vào cuối lời gọi `fetch()`. Sau đó chúng ta có thể truyền giá trị phản hồi kết quả vào các hàm chấp nhận nó, như thế này:

```js
fetch(requestURL).then((response) => {
  populateHeader(response);
  showHeroes(response);
});
```

Lưu và làm mới, và xem mã của bạn có hoạt động không. Cảnh báo hỏng — thay đổi ở trên vẫn chưa sửa được vấn đề. Thật không may, chúng ta **vẫn có cùng lỗi**!

> [!NOTE]
> Tóm lại, bất cứ khi nào có gì đó không hoạt động và một giá trị không có vẻ là những gì nó được cho là ở một điểm nào đó trong mã của bạn, bạn có thể sử dụng `console.log()`, `console.error()`, hoặc hàm tương tự khác để in ra giá trị và xem điều gì đang xảy ra.

## Sử dụng trình gỡ lỗi JavaScript

Hãy điều tra vấn đề này thêm bằng cách sử dụng tính năng tinh vi hơn của công cụ dành cho nhà phát triển trình duyệt: [trình gỡ lỗi JavaScript](https://firefox-source-docs.mozilla.org/devtools-user/debugger/index.html), như nó được gọi trong Firefox.

> [!NOTE]
> Các công cụ tương tự có sẵn trong các trình duyệt khác; [tab Sources](https://developer.chrome.com/docs/devtools/#sources) trong Chrome, Debugger trong Safari (xem [Safari Web Development Tools](https://developer.apple.com/safari/tools/)), v.v.

Trong Firefox, tab Debugger trông như thế này:

![Trình gỡ lỗi Firefox](debugger-tab.png)

- Ở bên trái, bạn có thể chọn script bạn muốn gỡ lỗi (trong trường hợp này chúng ta chỉ có một).
- Panel trung tâm hiển thị mã trong script được chọn.
- Panel bên phải hiển thị thông tin chi tiết hữu ích về môi trường hiện tại — _Breakpoints_ (Điểm dừng), _Callstack_ (Ngăn xếp lời gọi) và _Scopes_ (Phạm vi) hiện đang hoạt động.

Tính năng chính của những công cụ như vậy là khả năng thêm điểm dừng vào mã — đây là những điểm nơi thực thi mã dừng lại, và tại điểm đó bạn có thể kiểm tra môi trường ở trạng thái hiện tại của nó và xem điều gì đang xảy ra.

Hãy khám phá việc sử dụng điểm dừng:

1. Lỗi được ném ra ở cùng dòng như trước — `for (const hero of heroes) {` — dòng 26 trong ảnh chụp màn hình bên dưới. Nhấp vào số dòng trong panel trung tâm để thêm điểm dừng vào nó (bạn sẽ thấy mũi tên màu xanh xuất hiện phía trên nó).
2. Bây giờ làm mới trang (<kbd>Cmd</kbd>/<kbd>Ctrl</kbd> + <kbd>R</kbd>) — trình duyệt sẽ tạm dừng thực thi mã trên dòng đó. Tại thời điểm này, bên phải sẽ cập nhật để hiển thị nội dung sau:

![Trình gỡ lỗi Firefox với điểm dừng](breakpoint.png)

- Dưới _Breakpoints_, bạn sẽ thấy chi tiết của điểm dừng bạn đã đặt.
- Dưới _Call Stack_, bạn sẽ thấy một vài mục — đây về cơ bản giống như ngăn xếp lời gọi mà chúng ta đã xem xét trước đó trong phần `console.error()`. _Call Stack_ hiển thị danh sách các hàm đã được gọi để gây ra hàm hiện tại được gọi. Ở trên cùng, chúng ta có `showHeroes()`, hàm chúng ta hiện đang ở trong, và thứ hai chúng ta có `onload`, lưu trữ hàm trình xử lý sự kiện chứa lời gọi đến `showHeroes()`.
- Dưới _Scopes_, bạn sẽ thấy phạm vi hiện đang hoạt động cho hàm chúng ta đang xem xét. Chúng ta chỉ có ba — `showHeroes`, `block` và `Window` (phạm vi toàn cục). Mỗi phạm vi có thể được mở rộng để hiển thị các giá trị của biến bên trong phạm vi khi thực thi dừng lại.

Chúng ta có thể tìm thấy một số thông tin rất hữu ích ở đây:

1. Mở rộng phạm vi `showHeroes` — bạn có thể thấy từ đây rằng biến heroes là `undefined`, cho thấy việc truy cập thuộc tính `members` của `jsonObj` (dòng đầu tiên của hàm) không hoạt động.
2. Bạn cũng có thể thấy rằng biến `jsonObj` đang lưu trữ đối tượng {{domxref("Response")}}, không phải đối tượng JSON.

Đối số cho `showHeroes()` là giá trị mà promise `fetch()` được thực hiện với. Promise này không ở định dạng JSON: đó là đối tượng `Response`. Cần một bước thêm để lấy nội dung của phản hồi dưới dạng đối tượng JSON.

Chúng tôi muốn bạn thử tự mình sửa vấn đề này. Để bắt đầu, hãy xem tài liệu cho đối tượng {{domxref("Response")}}. Nếu bạn bị kẹt, bạn có thể tìm thấy mã nguồn đã sửa tại <https://github.com/mdn/learning-area/tree/main/tools-testing/cross-browser-testing/javascript/fetch-fixed>.

> [!NOTE]
> Tab debugger có nhiều tính năng hữu ích khác không được thảo luận ở đây. Ví dụ, điểm dừng có điều kiện và biểu thức theo dõi. Để biết thêm nhiều thông tin, hãy xem trang [Debugger](https://firefox-source-docs.mozilla.org/devtools-user/debugger/index.html).

## Xử lý lỗi JavaScript trong mã của bạn

HTML và CSS có tính khoan dung — lỗi và các tính năng không được nhận dạng thường có thể được xử lý do tính chất của các ngôn ngữ. Ví dụ, CSS sẽ bỏ qua các thuộc tính không được nhận dạng, và phần còn lại của mã thường vẫn hoạt động. Tuy nhiên, JavaScript không dễ dàng như HTML và CSS; nếu công cụ JavaScript gặp lỗi hoặc cú pháp không được nhận dạng, nó thường sẽ ném lỗi.

Hãy khám phá chiến lược phổ biến để xử lý lỗi JavaScript trong mã của bạn. Các phần sau được thiết kế để được theo dõi bằng cách tạo bản sao của tệp mẫu được hiển thị bên dưới dưới dạng `handling-errors.html` trên máy cục bộ của bạn, thêm các đoạn mã giữa các thẻ `<script>` và `</script>` mở và đóng, sau đó mở tệp trong trình duyệt và xem đầu ra trong bảng điều khiển JavaScript của devtools.

```html
<!doctype html>
<html lang="en-US">
  <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width" />
    <title>Handling JS errors</title>
  </head>
  <body>
    <script>
      // Code goes below this line
    </script>
  </body>
</html>
```

### Câu lệnh điều kiện

Một cách sử dụng phổ biến của [câu lệnh điều kiện JavaScript](/en-US/docs/Learn_web_development/Core/Scripting/Conditionals) là xử lý lỗi. Câu lệnh điều kiện cho phép bạn chạy các mã khác nhau tùy thuộc vào giá trị của một biến. Thường, bạn sẽ muốn sử dụng điều này một cách phòng thủ để tránh ném lỗi nếu giá trị không tồn tại hoặc sai kiểu, hoặc để bắt lỗi nếu giá trị có thể gây ra kết quả sai được trả về, có thể gây ra vấn đề sau.

Hãy xem một ví dụ. Giả sử chúng ta có một hàm lấy chiều cao của người dùng tính bằng inch làm đối số và trả về chiều cao của họ tính bằng mét, đến 2 chữ số thập phân. Nó có thể trông như thế này:

```js
function inchesToMeters(num) {
  const mVal = (num * 2.54) / 100;
  const m2dp = mVal.toFixed(2);
  return m2dp;
}
```

1. Trong phần tử `<script>` của tệp ví dụ, khai báo `const` gọi là `height` và gán cho nó giá trị `70`:

   ```js
   const height = 70;
   ```

2. Sao chép hàm trên bên dưới dòng trước đó.

3. Gọi hàm, truyền hằng số `height` làm đối số của nó và ghi giá trị trả về vào bảng điều khiển:

   ```js
   console.log(inchesToMeters(height));
   ```

4. Tải ví dụ trong trình duyệt và xem bảng điều khiển JavaScript của devtools. Bạn sẽ thấy giá trị `1.78` được ghi vào nó.

5. Vì vậy điều này hoạt động tốt trong sự cô lập. Nhưng điều gì xảy ra nếu dữ liệu được cung cấp bị thiếu hoặc không đúng? Hãy thử các tình huống này:
   - Nếu bạn thay đổi giá trị `height` thành `"70"` (tức là, `70` được biểu thị dưới dạng chuỗi), ví dụ sẽ... vẫn hoạt động tốt. Điều này là do phép tính trên dòng đầu tiên của chuỗi ép giá trị thành kiểu dữ liệu số. Điều này ổn trong trường hợp đơn giản như thế này, nhưng trong mã phức tạp hơn, dữ liệu sai có thể dẫn đến đủ loại lỗi, một số trong số đó tinh tế và khó phát hiện!
   - Nếu bạn thay đổi `height` thành giá trị không thể ép thành số, như `"70 inches"` hoặc `["Bob", 70]`, hoặc {{jsxref("NaN")}}, ví dụ sẽ trả về kết quả là `NaN`. Điều này có thể gây ra đủ loại vấn đề, ví dụ nếu bạn muốn bao gồm chiều cao của người dùng ở đâu đó trong giao diện người dùng trang web.
   - Nếu bạn xóa giá trị `height` hoàn toàn (đặt nó thành nhận xét bằng cách thêm `//` vào đầu dòng), bảng điều khiển sẽ hiển thị lỗi tương tự "Uncaught ReferenceError: height is not defined", loại mà có thể làm ứng dụng của bạn dừng hoàn toàn.

   Rõ ràng, không có kết quả nào trong số này là tốt. Làm thế nào để chúng ta tự bảo vệ chống lại dữ liệu xấu?

6. Hãy thêm câu lệnh điều kiện bên trong hàm của chúng ta để kiểm tra xem dữ liệu có tốt không trước khi chúng ta cố gắng thực hiện phép tính. Hãy thử thay thế hàm hiện tại của bạn bằng:

   ```js
   function inchesToMeters(num) {
     if (typeof num !== "number" || Number.isNaN(num)) {
       console.log("A number was not provided. Please correct the input.");
       return undefined;
     }
     const mVal = (num * 2.54) / 100;
     const m2dp = mVal.toFixed(2);
     return m2dp;
   }
   ```

7. Bây giờ, nếu bạn thử hai tình huống đầu tiên một lần nữa, bạn sẽ thấy thông báo hữu ích hơn một chút được trả về, để cho bạn biết những gì cần phải làm để sửa vấn đề. Bạn có thể đặt bất cứ thứ gì vào đó mà bạn thích, bao gồm cả việc cố gắng chạy mã để sửa giá trị của `num`, nhưng điều này không được khuyến nghị — hàm này có một mục đích đơn giản, và bạn nên xử lý việc sửa giá trị ở nơi khác trong hệ thống.

   > [!NOTE]
   > Trong câu lệnh `if()`, đầu tiên chúng ta kiểm tra xem kiểu dữ liệu của `num` có phải là `"number"` bằng cách sử dụng toán tử [`typeof`](/en-US/docs/Web/JavaScript/Reference/Operators/typeof), sau đó kiểm tra xem {{jsxref("Number.isNaN", "Number.isNaN(num)")}} trả về `false`. Chúng ta phải làm điều này để bảo vệ chống lại trường hợp cụ thể khi `num` được đặt thành `NaN`, bởi vì `typeof NaN` vẫn trả về `"number"`!

8. Tuy nhiên, nếu bạn thử tình huống thứ ba một lần nữa, bạn vẫn sẽ nhận được lỗi "Uncaught ReferenceError: height is not defined" được ném vào bạn. Bạn không thể sửa được thực tế là giá trị không có sẵn từ bên trong hàm đang cố gắng sử dụng giá trị.

Làm thế nào để xử lý điều này? Tốt hơn là để hàm của chúng ta trả về lỗi tùy chỉnh khi nó không nhận được dữ liệu đúng. Trước tiên chúng ta sẽ xem cách thực hiện điều đó, sau đó chúng ta sẽ xử lý tất cả các lỗi cùng nhau.

### Ném lỗi tùy chỉnh

Bạn có thể ném lỗi tùy chỉnh tại bất kỳ điểm nào trong mã của bạn bằng cách sử dụng câu lệnh [`throw`](/en-US/docs/Web/JavaScript/Reference/Statements/throw), kết hợp với hàm tạo {{jsxref("Error.Error", "Error()")}}. Hãy xem điều này trong hành động.

1. Trong hàm của bạn, hãy thay thế dòng `console.log()` bên trong khối `else` của hàm bằng dòng sau:

   ```js
   throw new Error("A number was not provided. Please correct the input.");
   ```

2. Chạy lại ví dụ của bạn, nhưng đảm bảo `num` được đặt thành giá trị xấu (tức là, không phải số). Lần này, bạn sẽ thấy lỗi tùy chỉnh của mình được ném, cùng với ngăn xếp lời gọi hữu ích để giúp bạn xác định nguồn gốc của lỗi (mặc dù lưu ý rằng thông báo vẫn cho chúng ta biết rằng lỗi là "uncaught" hoặc "unhandled"). OK, vì vậy lỗi là phiền phức, nhưng điều này hữu ích hơn nhiều so với việc chạy hàm thành công và trả về giá trị không phải số có thể gây ra vấn đề sau.

Vậy, làm thế nào để xử lý tất cả những lỗi đó?

### try...catch

Câu lệnh [`try...catch`](/en-US/docs/Web/JavaScript/Reference/Statements/try...catch) được thiết kế đặc biệt để xử lý lỗi. Nó có cấu trúc sau:

```js
try {
  // Run some code
} catch (error) {
  // Handle any errors
}
```

Bên trong khối `try`, bạn thử chạy một số mã. Nếu mã này chạy mà không có lỗi nào được ném, mọi thứ đều ổn và khối `catch` bị bỏ qua. Tuy nhiên, nếu lỗi được ném, khối `catch` được chạy, cung cấp quyền truy cập vào đối tượng {{jsxref("Error")}} biểu diễn lỗi, và cho phép bạn chạy mã để xử lý nó.

Hãy sử dụng `try...catch` trong mã của chúng ta.

1. Thay thế dòng `console.log()` gọi hàm `inchesToMeters()` ở cuối script của bạn bằng khối sau. Bây giờ chúng ta đang chạy dòng `console.log()` bên trong khối `try`, và xử lý bất kỳ lỗi nào mà nó trả về bên trong khối `catch` tương ứng.

   ```js
   try {
     console.log(inchesToMeters(height));
   } catch (error) {
     console.error(error);
     console.log("Insert code to handle the error");
   }
   ```

2. Lưu và làm mới, và bây giờ bạn sẽ thấy hai điều:
   - Thông báo lỗi và ngăn xếp lời gọi như trước, nhưng lần này không có nhãn "uncaught" hoặc "unhandled".
   - Thông báo được ghi "Insert code to handle the error".

3. Bây giờ hãy thử cập nhật `num` thành giá trị tốt (số), và bạn sẽ thấy kết quả của phép tính được ghi, không có thông báo lỗi.

Điều này có ý nghĩa — bất kỳ lỗi nào được ném bây giờ đều được xử lý, vì vậy chúng sẽ không làm ứng dụng bị sập. Bạn có thể chạy bất kỳ mã nào bạn thích để xử lý lỗi. Ở trên, chúng ta đang ghi một thông báo cơ bản, nhưng ví dụ, bạn có thể gọi hàm yêu cầu người dùng nhập chiều cao của họ một lần nữa, nhưng lần này yêu cầu họ sửa lỗi nhập. Bạn thậm chí có thể sử dụng câu lệnh `if...else` để chạy mã xử lý lỗi khác nhau tùy thuộc vào loại lỗi nào được trả về.

### Phát hiện tính năng

Phát hiện tính năng hữu ích khi bạn đang lên kế hoạch sử dụng các tính năng JavaScript mới có thể không được hỗ trợ trong tất cả các trình duyệt. Bạn có thể kiểm tra tính năng, sau đó chạy mã có điều kiện để cung cấp trải nghiệm chấp nhận được trong các trình duyệt hỗ trợ tính năng, và những trình duyệt không hỗ trợ. Như một ví dụ nhanh, [Geolocation API](/en-US/docs/Web/API/Geolocation_API) (tiết lộ dữ liệu vị trí có sẵn cho thiết bị trình duyệt web đang chạy trên) có điểm vào chính để sử dụng — thuộc tính `geolocation` có sẵn trên đối tượng toàn cục [Navigator](/en-US/docs/Web/API/Navigator). Do đó, bạn có thể phát hiện xem trình duyệt có hỗ trợ geolocation hay không bằng cách sử dụng cấu trúc `if()` tương tự như những gì chúng ta đã thấy trước đó:

```js
if ("geolocation" in navigator) {
  navigator.geolocation.getCurrentPosition((position) => {
    // show the location on a map, perhaps using the Google Maps API
  });
} else {
  // Give the user a choice of static maps instead
}
```

Bạn có thể tìm thấy thêm một số ví dụ phát hiện tính năng trong [Alternatives to UA sniffing](/en-US/docs/Web/HTTP/Guides/Browser_detection_using_the_user_agent#alternatives_to_ua_sniffing).

## Tìm kiếm sự giúp đỡ

Có nhiều vấn đề khác bạn sẽ gặp với JavaScript (và HTML và CSS!), khiến kiến thức về cách tìm câu trả lời trực tuyến trở nên vô giá.

Trong số các nguồn thông tin hỗ trợ tốt nhất là MDN, [stackoverflow.com](https://stackoverflow.com/), và [caniuse.com](https://caniuse.com/).

- Để sử dụng MDN, hầu hết mọi người thực hiện tìm kiếm qua công cụ tìm kiếm về công nghệ họ đang cố gắng tìm thông tin về, cộng với thuật ngữ "mdn", ví dụ, "mdn HTML video".
- [caniuse.com](https://caniuse.com/) cung cấp thông tin hỗ trợ, cùng với một số liên kết tài nguyên ngoài hữu ích. Ví dụ, xem <https://caniuse.com/#search=video> (bạn phải nhập tính năng bạn đang tìm kiếm vào hộp văn bản).
- [stackoverflow.com](https://stackoverflow.com/) (SO) là trang web diễn đàn nơi bạn có thể đặt câu hỏi và nhờ các nhà phát triển đồng nghiệp chia sẻ giải pháp của họ, tra cứu các bài đăng trước và giúp đỡ các nhà phát triển khác. Tìm kiếm câu trả lời cho câu hỏi của bạn để xem nó có tồn tại không, trước khi đăng câu hỏi mới. Ví dụ, chúng ta đã tìm kiếm "disabling autofocus on HTML dialog" trên SO, và rất nhanh chóng đã tìm được [Disable showModal auto-focusing using HTML attributes](https://stackoverflow.com/questions/63267581/disable-showmodal-auto-focusing-using-html-attributes).

Ngoài ra, hãy thử tìm kiếm trong công cụ tìm kiếm yêu thích của bạn để tìm câu trả lời cho vấn đề của bạn. Thường hữu ích khi tìm kiếm các thông báo lỗi cụ thể nếu bạn có — các nhà phát triển khác có khả năng đã gặp phải cùng vấn đề như bạn.

## Tóm tắt

Vậy đó là gỡ lỗi và xử lý lỗi JavaScript. Đơn giản chứ? Có lẽ không đơn giản như vậy, nhưng bài viết này ít nhất nên cung cấp cho bạn điểm khởi đầu và một số ý tưởng về cách giải quyết các vấn đề liên quan đến JavaScript bạn sẽ gặp.

Đó là tất cả cho module Scripting động với JavaScript; xin chúc mừng vì đã đến cuối! Trong module tiếp theo, chúng ta sẽ giúp bạn khám phá các framework và thư viện JavaScript.

{{PreviousMenuNext("Learn_web_development/Core/Scripting/House_data_UI","Learn_web_development/Core/Frameworks_libraries", "Learn_web_development/Core/Scripting")}}
