---
title: Thiết lập môi trường tự động hóa kiểm thử của riêng bạn
short-title: Thiết lập môi trường tự động hóa
slug: Learn_web_development/Extensions/Testing/Your_own_automation_environment
page-type: learn-module-chapter
sidebar: learnsidebar
---

{{PreviousMenu("Learn_web_development/Extensions/Testing/Automated_testing", "Learn_web_development/Extensions/Testing")}}

Trong bài viết này, chúng ta sẽ dạy bạn cách cài đặt môi trường tự động hóa của riêng bạn và chạy các bài kiểm thử của riêng bạn bằng Selenium/WebDriver và thư viện kiểm thử như selenium-webdriver cho Node. Chúng ta cũng sẽ xem xét cách tích hợp môi trường kiểm thử cục bộ của bạn với các ứng dụng thương mại như những ứng dụng được thảo luận trong bài viết trước.

<table>
  <tbody>
    <tr>
      <th scope="row">Điều kiện tiên quyết:</th>
      <td>
        Quen thuộc với các ngôn ngữ cốt lõi <a href="/en-US/docs/Learn_web_development/Core/Structuring_content">HTML</a>,
        <a href="/en-US/docs/Learn_web_development/Core/Styling_basics">CSS</a>, và
        <a href="/en-US/docs/Learn_web_development/Core/Scripting">JavaScript</a>; có ý tưởng về các nguyên tắc cấp cao
        <a href="/en-US/docs/Learn_web_development/Extensions/Testing/Introduction">của kiểm thử đa trình duyệt</a>, và
        <a href="/en-US/docs/Learn_web_development/Extensions/Testing/Automated_testing">kiểm thử tự động</a>.
      </td>
    </tr>
    <tr>
      <th scope="row">Mục tiêu:</th>
      <td>
        Chỉ cách thiết lập môi trường kiểm thử Selenium cục bộ và chạy các bài kiểm thử với nó, và cách tích hợp nó với các công cụ như Sauce Labs và BrowserStack.
      </td>
    </tr>
  </tbody>
</table>

## Selenium

[Selenium](https://www.selenium.dev/) là công cụ tự động hóa trình duyệt phổ biến nhất. Có các cách khác, nhưng cách tốt nhất để sử dụng Selenium là qua WebDriver, một API mạnh mẽ được xây dựng trên Selenium và thực hiện các lệnh gọi đến trình duyệt để tự động hóa nó, thực hiện các hành động như "mở trang web này", "di chuyển đến phần tử này trên trang", "nhấp vào liên kết này", "xem liệu liên kết có mở URL này không", v.v. Đây là lý tưởng để chạy các bài kiểm thử tự động.

Cách bạn cài đặt và sử dụng WebDriver phụ thuộc vào môi trường lập trình bạn muốn sử dụng để viết và chạy các bài kiểm thử. Hầu hết các môi trường phổ biến đều có gói hoặc khung có sẵn để cài đặt WebDriver và các ràng buộc cần thiết để giao tiếp với WebDriver sử dụng ngôn ngữ này, ví dụ: Java, C#, Ruby, Python, JavaScript (Node), v.v. Xem [Setting Up a Selenium-WebDriver Project](https://www.selenium.dev/documentation/webdriver/getting_started/) để biết thêm chi tiết về thiết lập Selenium cho các ngôn ngữ khác nhau.

Các trình duyệt khác nhau yêu cầu các trình điều khiển khác nhau để cho phép WebDriver giao tiếp và kiểm soát chúng. Xem [Platforms Supported by Selenium](https://www.selenium.dev/downloads/) để biết thêm thông tin về nơi lấy trình điều khiển trình duyệt, v.v.

Chúng ta sẽ đề cập đến việc viết và chạy các bài kiểm thử Selenium bằng Node.js, vì nó nhanh và dễ dàng để bắt đầu, và là môi trường quen thuộc hơn với các nhà phát triển front end.

> [!NOTE]
> Nếu bạn muốn tìm hiểu cách sử dụng WebDriver với các môi trường phía máy chủ khác, hãy kiểm tra [Platforms Supported by Selenium](https://www.selenium.dev/downloads/) để biết một số liên kết hữu ích.

### Thiết lập Selenium trong Node

1. Để bắt đầu, thiết lập một dự án npm mới, như được thảo luận trong [Thiết lập Node và npm](/en-US/docs/Learn_web_development/Extensions/Testing/Automated_testing#setting_up_node_and_npm) trong chương trước. Đặt tên khác, như `selenium-test`.
2. Tiếp theo, chúng ta cần cài đặt khung để cho phép chúng ta làm việc với Selenium từ bên trong Node. Chúng ta sẽ chọn [selenium-webdriver](https://www.npmjs.com/package/selenium-webdriver) chính thức của Selenium, vì tài liệu có vẻ khá cập nhật và được bảo trì tốt. Để cài đặt selenium-webdriver, chạy lệnh sau, đảm bảo bạn đang ở trong thư mục dự án:

   ```bash
   npm install selenium-webdriver
   ```

Tiếp theo, bạn cần tải xuống các trình điều khiển liên quan để cho phép WebDriver kiểm soát các trình duyệt bạn muốn kiểm thử. Bạn có thể tìm thấy chi tiết về nơi lấy chúng trên trang [selenium-webdriver](https://www.npmjs.com/package/selenium-webdriver).

1. Tải xuống các trình điều khiển [GeckoDriver](https://github.com/mozilla/geckodriver/releases/) mới nhất (cho Firefox) và [ChromeDriver](https://googlechromelabs.github.io/chrome-for-testing/#stable).
2. Giải nén chúng vào nơi dễ điều hướng, như thư mục gốc của thư mục người dùng chủ của bạn.
3. Thêm vị trí trình điều khiển `chromedriver` và `geckodriver` vào biến `PATH` hệ thống của bạn.

> [!NOTE]
> Chỉ cần nhắc lại, đường dẫn bạn thêm vào `PATH` cần là đường dẫn đến thư mục chứa các trình điều khiển, không phải đường dẫn đến chính các trình điều khiển! Đây là lỗi phổ biến.

Để đặt biến `PATH` trên hệ thống macOS và trên hầu hết các hệ thống Linux:

1. Mở tệp `.zprofile` (hoặc `.bash_profile` nếu hệ thống của bạn sử dụng shell `bash`).
2. Dán nội dung sau vào cuối tệp (cập nhật đường dẫn như thực sự trên máy của bạn):

   ```bash
   # Add WebDriver browser drivers to PATH
   export PATH=$PATH:/Users/bob
   ```

3. Lưu và đóng tệp này, sau đó khởi động lại Terminal/command prompt để áp dụng lại cấu hình.
4. Kiểm tra rằng các đường dẫn mới của bạn trong biến `PATH` bằng cách nhập vào terminal:

   ```bash
   echo $PATH
   ```

Hãy thử kiểm thử nhanh để đảm bảo mọi thứ đang hoạt động.

1. Tạo tệp mới bên trong thư mục dự án của bạn gọi là `duck_test.js`.
2. Đặt cho nó nội dung sau, sau đó lưu nó:

   ```js
   const { Builder, Browser, By, Key, until } = require("selenium-webdriver");

   (async function example() {
     const driver = await new Builder().forBrowser(Browser.FIREFOX).build();
     try {
       await driver.get("https://duckduckgo.com/");
       await driver.findElement(By.name("q")).sendKeys("webdriver", Key.RETURN);
       await driver.wait(until.titleIs("webdriver at DuckDuckGo"), 1000);
       console.log("Test passed!");
     } catch (e) {
       console.log(`Error: ${e}`);
     } finally {
       await driver.sleep(2000); // Delay long enough to see search page!
       await driver.quit();
     }
   })();
   ```

   > [!NOTE]
   > Hàm này là {{glossary("IIFE")}} (Immediately Invoked Function Expression — Biểu thức hàm được gọi ngay lập tức).

3. Trong terminal, đảm bảo bạn đang ở trong thư mục dự án của mình, sau đó nhập lệnh sau:

   ```bash
   node duck_test
   ```

Bạn sẽ thấy một phiên bản Firefox tự động mở lên! DuckDuckGo sẽ tự động được tải trong một tab, "webdriver" sẽ được nhập vào hộp tìm kiếm và nút tìm kiếm sẽ được nhấp. WebDriver sau đó sẽ chờ 1 giây; tiêu đề tài liệu được truy cập, và nếu đó là "webdriver at DuckDuckGo", chúng ta sẽ trả về thông báo để cho biết bài kiểm thử đã vượt qua.

## Kiểm thử trong nhiều trình duyệt cùng lúc

Cũng không có gì ngăn bạn chạy bài kiểm thử trên nhiều trình duyệt cùng lúc. Hãy thử điều này!

1. Tạo tệp mới khác bên trong thư mục dự án của bạn gọi là `duck_test_multiple.js`.
2. Đặt cho tệp nội dung sau, sau đó lưu nó:

   ```js
   const { Builder, Browser, By, Key } = require("selenium-webdriver");

   const driverFx = new Builder().forBrowser(Browser.FIREFOX).build();
   const driverChr = new Builder().forBrowser(Browser.CHROME).build();

   async function searchTest(driver) {
     try {
       await driver.get("https://duckduckgo.com/");
       await driver.findElement(By.name("q")).sendKeys("webdriver", Key.RETURN);
       await driver.sleep(2000);
       const title = await driver.getTitle();
       if (title === "webdriver at DuckDuckGo") {
         console.log("Test passed");
       } else {
         console.log("Test failed");
       }
     } finally {
       driver.quit();
     }
   }

   searchTest(driverFx);
   searchTest(driverChr);
   ```

3. Trong terminal, đảm bảo bạn đang ở trong thư mục dự án của mình, sau đó nhập lệnh sau:

   ```bash
   node duck_test_multiple
   ```

Vì vậy, ở đây chúng ta đã thực hiện bài kiểm thử như trước, ngoại trừ lần này chúng ta đã bọc nó trong một hàm, `searchTest()`. Chúng ta đã tạo các phiên bản trình duyệt mới cho nhiều trình duyệt, sau đó truyền mỗi trình duyệt đó vào hàm để bài kiểm thử được thực hiện trên tất cả chúng.

## Khóa học sơ lược về cú pháp WebDriver

Hãy xem một số tính năng chính của cú pháp webdriver. Để biết chi tiết đầy đủ hơn, bạn nên tham khảo [tài liệu tham chiếu API JavaScript selenium-webdriver](https://www.selenium.dev/selenium/docs/api/javascript/) và tài liệu Selenium chính [Selenium WebDriver](https://www.selenium.dev/documentation/webdriver/).

### Bắt đầu bài kiểm thử mới

Để khởi động bài kiểm thử mới, bạn cần bao gồm mô-đun `selenium-webdriver`, nhập hàm tạo `Builder` và giao diện `Browser`:

```js
const { Builder, Browser } = require("selenium-webdriver");
```

Bạn sử dụng hàm tạo `Builder()` để tạo phiên bản mới của trình điều khiển, xâu chuỗi phương thức `forBrowser()` để chỉ định trình duyệt bạn muốn kiểm thử với trình xây dựng này.
Phương thức `build()` được xâu chuỗi ở cuối để thực sự xây dựng phiên bản trình điều khiển.

```js
let driver = new Builder().forBrowser(Browser.FIREFOX).build();
```

Lưu ý rằng có thể đặt các tùy chọn cấu hình cụ thể cho các trình duyệt cần kiểm thử, ví dụ: bạn có thể đặt phiên bản và hệ điều hành cụ thể để kiểm thử trong phương thức `forBrowser()`:

```js
let driver = new Builder().forBrowser(Browser.FIREFOX, "130", "MAC").build();
```

Bạn cũng có thể đặt các tùy chọn này bằng biến môi trường, ví dụ:

```bash
SELENIUM_BROWSER=firefox:130:MAC
```

Hãy tạo bài kiểm thử mới để cho phép chúng ta khám phá mã này khi chúng ta nói về nó. Bên trong thư mục dự án kiểm thử selenium của bạn, tạo tệp mới gọi là `quick_test.js` và thêm mã sau vào nó:

```js
const { Builder, Browser } = require("selenium-webdriver");

(async function example() {
  const driver = await new Builder().forBrowser(Browser.FIREFOX).build();
})();
```

Bạn có thể kiểm thử ví dụ bằng cách nhập lệnh sau vào terminal:

```bash
node quick_test
```

### Lấy tài liệu bạn muốn kiểm thử

Để tải trang bạn thực sự muốn kiểm thử, bạn sử dụng phương thức `get()` của phiên bản trình điều khiển bạn đã tạo trước đó, ví dụ:

```js
driver.get("http://www.google.com");
```

Bạn có thể sử dụng bất kỳ URL nào để trỏ đến tài nguyên của mình, bao gồm URL `file://` để kiểm thử tài liệu cục bộ:

```js
driver.get("file:///Users/bob/git/examples/test_file.html");
```

Tuy nhiên, tốt hơn là sử dụng vị trí máy chủ từ xa để mã linh hoạt hơn — khi bạn bắt đầu sử dụng máy chủ từ xa để chạy các bài kiểm thử, mã của bạn sẽ bị lỗi nếu bạn cố sử dụng đường dẫn cục bộ.

Cập nhật hàm `example()` của bạn như sau, thay thế đường dẫn giữ chỗ bằng đường dẫn cục bộ thực sự đến tệp HTML trên máy tính của bạn, sau đó thử chạy nó:

```js
const { Builder, Browser } = require("selenium-webdriver");

(async function example() {
  const driver = await new Builder().forBrowser(Browser.FIREFOX).build();
  driver.get("file:///Users/bob/git/examples/test_file.html");
})();
```

### Tương tác với tài liệu

Bây giờ chúng ta đã có tài liệu để kiểm thử, chúng ta cần tương tác với nó theo cách nào đó, thường bao gồm việc đầu tiên chọn một phần tử cụ thể để kiểm thử điều gì đó. Bạn có thể [chọn các phần tử UI theo nhiều cách](https://www.selenium.dev/documentation/webdriver/elements/) trong WebDriver, bao gồm theo ID, lớp, tên phần tử, v.v. Việc chọn thực sự được thực hiện bởi phương thức `findElement()`, chấp nhận một phương thức chọn làm tham số. Ví dụ, để chọn phần tử theo ID:

```js
const element = driver.findElement(By.id("myElementId"));
```

Một trong những cách hữu ích nhất để tìm phần tử theo CSS — phương thức `By.css()` cho phép bạn chọn phần tử bằng bộ chọn CSS.

Cập nhật hàm `example()` của bạn bây giờ như sau, sau đó chạy ví dụ:

```js
const { Builder, Browser, By } = require("selenium-webdriver");

(async function example() {
  const driver = await new Builder().forBrowser(Browser.FIREFOX).build();
  driver.get(
    "https://mdn.github.io/learning-area/tools-testing/cross-browser-testing/accessibility/native-keyboard-accessibility.html",
  );
  const button = driver.findElement(By.css("button:nth-of-type(1)"));
})();
```

### Kiểm thử phần tử của bạn

Có nhiều cách để tương tác với các tài liệu web và các phần tử bên trong chúng. Bạn có thể thấy các ví dụ phổ biến hữu ích bắt đầu từ [Getting text values](https://www.selenium.dev/documentation/webdriver/elements/information/#text-content) trên tài liệu WebDriver.

Nếu chúng ta muốn lấy văn bản bên trong nút của mình, chúng ta có thể làm như sau:

```js
button.getText().then((text) => {
  console.log(`Button text is '${text}'`);
});
```

Thêm điều này vào cuối hàm `example()` bây giờ như hiển thị bên dưới:

```js
const { Builder, Browser, By } = require("selenium-webdriver");

(async function example() {
  const driver = await new Builder().forBrowser(Browser.FIREFOX).build();

  driver.get(
    "https://mdn.github.io/learning-area/tools-testing/cross-browser-testing/accessibility/native-keyboard-accessibility.html",
  );

  const button = driver.findElement(By.css("button:nth-of-type(1)"));

  button.getText().then((text) => {
    console.log(`Button text is '${text}'`);
  });
})();
```

Hãy làm điều gì đó hữu ích hơn. Thay thế mục nhập mã trước bằng `button.click();` như bên dưới:

```js
const { Builder, Browser, By } = require("selenium-webdriver");

(async function example() {
  const driver = await new Builder().forBrowser(Browser.FIREFOX).build();
  driver.get(
    "https://mdn.github.io/learning-area/tools-testing/cross-browser-testing/accessibility/native-keyboard-accessibility.html",
  );

  const button = driver.findElement(By.css("button:nth-of-type(1)"));

  button.click();
})();
```

Hãy thử chạy bài kiểm thử của bạn lại; nút sẽ được nhấp và cửa sổ bật lên `alert()` sẽ xuất hiện.

Bạn có thể tương tác với cửa sổ bật lên cũng như. Cập nhật hàm `example()` như sau, và thử kiểm thử lại:

```js
const { Builder, Browser, By, until } = require("selenium-webdriver");

(async function example() {
  const driver = await new Builder().forBrowser(Browser.FIREFOX).build();

  driver.get(
    "https://mdn.github.io/learning-area/tools-testing/cross-browser-testing/accessibility/native-keyboard-accessibility.html",
  );

  const button = driver.findElement(By.css("button:nth-of-type(1)"));

  button.click();

  await driver.wait(until.alertIsPresent());

  const alert = driver.switchTo().alert();

  alert.getText().then((text) => {
    console.log(`Alert text is '${text}'`);
  });

  alert.accept();
})();
```

Tiếp theo, hãy thử nhập một số văn bản vào các phần tử biểu mẫu. Cập nhật hàm `example()` như sau và thử chạy lại bài kiểm thử:

```js
const { Builder, Browser, By, Key } = require("selenium-webdriver");

(async function example() {
  const driver = await new Builder().forBrowser(Browser.FIREFOX).build();
  driver.get(
    "https://mdn.github.io/learning-area/tools-testing/cross-browser-testing/accessibility/native-keyboard-accessibility.html",
  );

  const input = driver.findElement(By.id("name"));
  input.sendKeys("Bob Smith");

  input.sendKeys(Key.TAB);

  const input2 = driver.findElement(By.id("age"));
  input2.sendKeys("65");
})();
```

Bạn có thể gửi các lần nhấn phím không thể được biểu diễn bằng các ký tự thông thường bằng cách sử dụng các thuộc tính của đối tượng `Key`. Ví dụ, ở trên chúng ta đã sử dụng cách sau để tab giữa các input biểu mẫu:

```js
input.sendKeys(Key.TAB);
```

### Chờ điều gì đó hoàn thành

Có những lúc bạn sẽ muốn WebDriver chờ điều gì đó hoàn thành trước khi tiếp tục. Ví dụ, nếu bạn tải trang mới, bạn sẽ muốn chờ DOM của trang tải xong trước khi cố tương tác với bất kỳ phần tử nào của nó, nếu không bài kiểm thử có thể thất bại.

Trong bài kiểm thử `duck_test_multiple.js` của chúng ta chẳng hạn, chúng ta đã bao gồm dòng này:

```js
await driver.sleep(2000);
```

Phương thức `sleep()` chấp nhận giá trị xác định thời gian chờ tính bằng mili giây — phương thức trả về {{jsxref("Promise")}} giải quyết ở cuối thời gian đó. Chúng ta sử dụng từ khóa `await` để tạm dừng hàm bao quanh cho đến khi promise giải quyết.

Chúng ta cũng có thể thêm phương thức `sleep()` vào bài kiểm thử `quick_test.js` của chúng ta — thử cập nhật hàm `example()` của bạn như sau:

```js
const { Builder, Browser, By, Key } = require("selenium-webdriver");

(async function example() {
  const driver = await new Builder().forBrowser(Browser.FIREFOX).build();
  driver.get(
    "https://mdn.github.io/learning-area/tools-testing/cross-browser-testing/accessibility/native-keyboard-accessibility.html",
  );

  const input = driver.findElement(By.id("name"));
  input.sendKeys("Bob Smith");

  driver.sleep(1000).then(() => {
    input.getAttribute("value").then((value) => {
      if (value !== "") {
        console.log("Form input filled out");
      } else {
        console.log("Text could not be entered");
      }
    });
  });
})();
```

### Tắt trình điều khiển sau khi sử dụng

Sau khi bạn đã chạy xong bài kiểm thử, bạn nên tắt bất kỳ phiên bản trình điều khiển nào bạn đã mở bằng phương thức `driver.quit()`, để đảm bảo chúng không tiếp tục sử dụng tài nguyên không cần thiết. Cập nhật `quick_test.js` như sau:

```js
const { Builder, Browser, By, Key } = require("selenium-webdriver");

(async function example() {
  const driver = await new Builder().forBrowser(Browser.FIREFOX).build();
  driver.get(
    "https://mdn.github.io/learning-area/tools-testing/cross-browser-testing/accessibility/native-keyboard-accessibility.html",
  );

  const input = driver.findElement(By.id("name"));
  input.sendKeys("Bob Smith");

  driver.sleep(1000).then(() => {
    input
      .getAttribute("value")
      .then((value) => {
        if (value !== "") {
          console.log("Form input filled out");
        } else {
          console.log("Text could not be entered");
        }
      })
      .finally(() => {
        driver.quit();
      });
  });
})();
```

## Thực hành tốt nhất về kiểm thử

Đã có rất nhiều bài viết về các thực hành tốt nhất để viết bài kiểm thử. Bạn có thể tìm thấy một số thông tin nền tốt tại [Test Practices](https://www.selenium.dev/documentation/test_practices/). Nói chung, bạn nên đảm bảo rằng các bài kiểm thử của bạn:

1. Sử dụng chiến lược định vị tốt: Khi bạn [Tương tác với tài liệu](#interacting_with_the_document), hãy đảm bảo rằng bạn sử dụng bộ định vị và đối tượng trang không có khả năng thay đổi — nếu bạn có phần tử có thể kiểm thử mà bạn muốn thực hiện bài kiểm thử, hãy đảm bảo rằng nó có ID ổn định hoặc vị trí trên trang có thể được chọn bằng bộ chọn CSS. Bạn muốn làm cho các bài kiểm thử của mình càng không dễ vỡ càng tốt.
2. Viết các bài kiểm thử nguyên tử: Mỗi bài kiểm thử chỉ nên kiểm thử một thứ, giúp dễ dàng theo dõi tệp kiểm thử nào đang kiểm thử tiêu chí nào.
3. Viết các bài kiểm thử tự chủ: Mỗi bài kiểm thử phải hoạt động độc lập và không phụ thuộc vào các bài kiểm thử khác để hoạt động.

Ngoài ra, chúng ta nên đề cập đến kết quả kiểm thử/báo cáo — chúng ta đã báo cáo kết quả trong các ví dụ trên bằng cách sử dụng các câu lệnh `console.log()` đơn giản, nhưng tất cả điều này được thực hiện bằng JavaScript, vì vậy bạn có thể sử dụng bất kỳ hệ thống chạy kiểm thử và báo cáo nào bạn muốn, chẳng hạn như [Mocha](https://mochajs.org/), [Chai](https://www.chaijs.com/), hoặc một công cụ khác. Hãy làm qua một ví dụ nhanh:

1. Tạo bản sao cục bộ của ví dụ [`mocha_test.js`](https://github.com/mdn/learning-area/blob/main/tools-testing/cross-browser-testing/selenium/mocha_test.js) bên trong thư mục dự án của bạn. Đặt nó vào thư mục con gọi là `test`.
2. Cài đặt khung kiểm thử mocha bằng cách chạy lệnh sau bên trong thư mục dự án của bạn:

   ```bash
   npm install --save-dev mocha
   ```

3. Bây giờ bạn có thể chạy bài kiểm thử bằng lệnh sau:

   ```bash
   npx mocha --no-timeouts
   ```

4. Bạn nên bao gồm cờ `--no-timeouts` để đảm bảo các bài kiểm thử của bạn không kết thúc thất bại vì timeout tùy ý của Mocha (là 3 giây).

## Chạy kiểm thử từ xa

Hóa ra chạy các bài kiểm thử trên máy chủ từ xa không khó hơn nhiều so với chạy chúng cục bộ. Bạn chỉ cần tạo phiên bản trình điều khiển của mình, nhưng với một vài tính năng được chỉ định thêm, bao gồm khả năng của trình duyệt bạn muốn kiểm thử, địa chỉ của máy chủ và thông tin đăng nhập người dùng bạn cần (nếu có) để truy cập nó.

### BrowserStack

Hãy tạo ví dụ để chỉ cách chạy bài kiểm thử Selenium từ xa trên [BrowserStack](https://www.browserstack.com/automate):

1. Bên trong thư mục dự án của bạn, tạo tệp mới gọi là `bstack_duck_test.js`.
2. Đặt cho nó nội dung sau:

   ```js
   const { Builder, By, Key } = require("selenium-webdriver");

   // Input capabilities
   const capabilities = {
     "bstack:options": {
       os: "OS X",
       osVersion: "Sonoma",
       browserVersion: "17.0",
       local: "false",
       seleniumVersion: "3.14.0",
       userName: "YOUR-USER-NAME",
       accessKey: "YOUR-ACCESS-KEY",
     },
     browserName: "Safari",
   };

   const driver = new Builder()
     .usingServer("http://hub-cloud.browserstack.com/wd/hub")
     .withCapabilities(capabilities)
     .build();

   (async function bStackGoogleTest() {
     try {
       await driver.get("https://duckduckgo.com/");
       await driver.findElement(By.name("q")).sendKeys("webdriver", Key.RETURN);
       await driver.sleep(2000);
       const title = await driver.getTitle();
       if (title === "webdriver at DuckDuckGo") {
         console.log("Test passed");
       } else {
         console.log("Test failed");
       }
     } finally {
       await driver.sleep(4000); // Delay long enough to see search page!
       await driver.quit();
     }
   })();
   ```

3. Từ trang [Account & Profile details](https://www.browserstack.com/accounts/profile/details) của BrowserStack, lấy tên người dùng và khóa truy cập của bạn.
4. Thay thế các chỗ giữ `YOUR-USER-NAME` và `YOUR-ACCESS-KEY` trong mã bằng các giá trị tên người dùng và khóa truy cập thực tế của bạn (và đảm bảo giữ chúng an toàn).
5. Chạy bài kiểm thử của bạn với lệnh sau:

   ```bash
   node bstack_google_test
   ```

   Bài kiểm thử sẽ được gửi đến BrowserStack và kết quả kiểm thử sẽ được trả về console của bạn.

6. Bây giờ nếu bạn quay lại [bảng điều khiển BrowserStack Automate](https://automate.browserstack.com/dashboard/), bạn sẽ thấy bài kiểm thử của mình được liệt kê, với chi tiết bao gồm video ghi lại bài kiểm thử và nhiều nhật ký chi tiết.

#### Điền chi tiết bài kiểm thử BrowserStack theo chương trình

Bạn có thể sử dụng BrowserStack REST API và một số khả năng khác để chú thích bài kiểm thử của bạn với nhiều chi tiết hơn, chẳng hạn như liệu nó có vượt qua không, lý do tại sao nó vượt qua, bài kiểm thử thuộc dự án nào, v.v.

Hãy cập nhật demo `bstack_duck_test.js` của chúng ta để chỉ cách các tính năng này hoạt động:

1. Cài đặt mô-đun [axios](https://www.npmjs.com/package/axios) bằng cách chạy lệnh sau bên trong thư mục dự án của bạn:

   ```bash
   npm install axios
   ```

2. Nhập mô-đun axios để chúng ta có thể sử dụng nó để gửi yêu cầu đến BrowserStack REST API. Thêm dòng sau ở đầu mã:

   ```js
   const axios = require("axios");
   ```

3. Bây giờ chúng ta sẽ cập nhật đối tượng `capabilities` để bao gồm tên dự án — thêm dòng sau trước dấu ngoặc nhọn đóng:

   ```js
   const capabilities = {
     // …
     project: "DuckDuckGo test 2",
   };
   ```

4. Tiếp theo chúng ta sẽ truy xuất `sessionId` của phiên hiện tại và sử dụng nó (cùng với `userName` và `accessKey` của bạn) để lắp ráp URL để gửi yêu cầu đến, để cập nhật dữ liệu BrowserStack. Bao gồm các dòng sau ngay bên dưới khối tạo đối tượng `driver`:

   ```js
   let sessionId;
   let bstackURL;

   driver.session_.then((sessionData) => {
     sessionId = sessionData.id_;
     bstackURL = `https://${capabilities["bstack:options"].userName}:${capabilities["bstack:options"].accessKey}@www.browserstack.com/automate/sessions/${sessionId}.json`;
   });
   ```

5. Cuối cùng, cập nhật khối `if...else` gần cuối mã để gửi các lệnh gọi API thích hợp đến BrowserStack tùy thuộc vào việc bài kiểm thử có vượt qua hay thất bại:

   ```js
   if (title === "webdriver at DuckDuckGo") {
     console.log("Test passed");
     axios.put(bstackURL, {
       status: "passed",
       reason: "DuckDuckGo results showed correct title",
     });
   } else {
     console.log("Test failed");
     axios.put(bstackURL, {
       status: "failed",
       reason: "DuckDuckGo results showed wrong title",
     });
   }
   ```

### Sauce Labs

Hãy xem xét một ví dụ chỉ cách chạy các bài kiểm thử Selenium từ xa trên Sauce Labs:

1. Bên trong thư mục dự án của bạn, tạo tệp mới gọi là `sauce_google_test.js`.
2. Đặt cho nó nội dung sau:

   ```js
   const { Builder, By, Key } = require("selenium-webdriver");

   const username = "YOUR-USER-NAME";
   const accessKey = "YOUR-ACCESS-KEY";

   const driver = new Builder()
     .withCapabilities({
       browserName: "chrome",
       platform: "Windows XP",
       version: "43.0",
       username,
       accessKey,
     })
     .usingServer(
       `https://${username}:${accessKey}@ondemand.saucelabs.com:443/wd/hub`,
     )
     .build();

   driver.get("http://www.google.com");

   driver.findElement(By.name("q")).sendKeys("webdriver");

   driver.sleep(1000).then(() => {
     driver.findElement(By.name("q")).sendKeys(Key.TAB);
   });

   driver.findElement(By.name("btnK")).click();

   driver.sleep(2000).then(() => {
     driver.getTitle().then((title) => {
       if (title === "webdriver - Google Search") {
         console.log("Test passed");
       } else {
         console.log("Test failed");
       }
     });
   });

   driver.quit();
   ```

3. Từ [cài đặt người dùng Sauce Labs](https://app.saucelabs.com/user-settings) của bạn, lấy tên người dùng và khóa truy cập. Thay thế các chỗ giữ `YOUR-USER-NAME` và `YOUR-ACCESS-KEY` trong mã bằng các giá trị thực tế của bạn.
4. Chạy bài kiểm thử của bạn với lệnh sau:

   ```bash
   node sauce_google_test
   ```

   Bài kiểm thử sẽ được gửi đến Sauce Labs và kết quả kiểm thử sẽ được trả về console của bạn.

5. Bây giờ nếu bạn đến trang [Sauce Labs Automated Test dashboard](https://app.saucelabs.com/dashboard/tests), bạn sẽ thấy bài kiểm thử của mình được liệt kê; từ đây bạn sẽ có thể xem video, ảnh chụp màn hình và dữ liệu khác.

### Máy chủ từ xa của riêng bạn

Nếu bạn không muốn sử dụng dịch vụ như Sauce Labs hoặc BrowserStack, bạn luôn có thể thiết lập máy chủ kiểm thử từ xa của riêng mình. Hãy xem cách thực hiện điều này.

1. Máy chủ từ xa Selenium yêu cầu Java để chạy. Tải xuống JDK mới nhất cho nền tảng của bạn từ [trang tải xuống Java SE](https://www.oracle.com/java/technologies/downloads/).
2. Tiếp theo, tải xuống [máy chủ Selenium standalone](https://selenium-release.storage.googleapis.com/index.html) mới nhất — đây là proxy giữa tập lệnh của bạn và các trình điều khiển trình duyệt. Chọn số phiên bản ổn định mới nhất (tức là không phải beta), và từ danh sách chọn tệp bắt đầu bằng "selenium-server-standalone". Khi đã tải xuống, đặt nó vào nơi hợp lý.
3. Chạy máy chủ standalone bằng cách nhập lệnh sau vào terminal trên máy chủ của bạn

   ```bash
   java -jar selenium-server-standalone-3.0.0.jar
   ```

4. Máy chủ sẽ chạy tại `http://localhost:4444/wd/hub` — hãy thử đến đó bây giờ để xem bạn nhận được gì.

Bây giờ chúng ta đã có máy chủ đang chạy, hãy tạo bài kiểm thử demo sẽ chạy trên máy chủ selenium từ xa.

1. Tạo bản sao của tệp `google_test.js` và đặt tên là `google_test_remote.js`; đặt nó vào thư mục dự án của bạn.
2. Cập nhật dòng mã (bắt đầu với `const driver = …`) như sau:

   ```js
   const driver = new Builder()
     .forBrowser(Browser.FIREFOX)
     .usingServer("http://localhost:4444/wd/hub")
     .build();
   ```

3. Chạy bài kiểm thử của bạn, và bạn sẽ thấy nó chạy như mong đợi; lần này tuy nhiên bạn sẽ chạy nó trên máy chủ standalone:

   ```bash
   node google_test_remote.js
   ```

## Tích hợp Selenium với các công cụ CI

Ngoài ra, cũng có thể tích hợp Selenium và các công cụ liên quan như Sauce Labs với {{glossary("continuous integration")}} (CI — Tích hợp liên tục) — điều này hữu ích, vì nó có nghĩa là bạn có thể chạy các bài kiểm thử qua công cụ CI, và chỉ commit các thay đổi mới vào kho mã của bạn nếu các bài kiểm thử vượt qua.

Nằm ngoài phạm vi để xem xét chi tiết khu vực này trong bài viết này, nhưng chúng ta gợi ý bắt đầu với Travis CI — đây có thể là công cụ CI dễ bắt đầu nhất và có tích hợp tốt với các công cụ web như GitHub và Node.

Để bắt đầu, hãy xem ví dụ:

- [Travis CI for complete beginners](https://docs.travis-ci.com/user/for-beginners)
- [Building a Node.js project](https://docs.travis-ci.com/user/languages/javascript-with-nodejs/) (với Travis)
- [Using Sauce Labs with Travis CI](https://docs.travis-ci.com/user/sauce-connect/)

> [!NOTE]
> Nếu bạn muốn thực hiện kiểm thử liên tục với **tự động hóa không cần mã**, bạn có thể sử dụng [Endtest](https://www.endtest.io/) hoặc [TestingBot](https://testingbot.com/).

## Tóm tắt

Mô-đun này nên đã chứng minh là thú vị, và nên đã cho bạn đủ thông tin về viết và chạy các bài kiểm thử tự động để bạn có thể bắt đầu viết các bài kiểm thử tự động của riêng mình.

{{PreviousMenu("Learn_web_development/Extensions/Testing/Automated_testing", "Learn_web_development/Extensions/Testing")}}
