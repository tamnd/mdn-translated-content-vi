---
title: Hàm — các khối mã có thể tái sử dụng
short-title: Functions
slug: Learn_web_development/Core/Scripting/Functions
page-type: learn-module-chapter
sidebar: learnsidebar
---

{{PreviousMenuNext("Learn_web_development/Core/Scripting/Test_your_skills/Loops","Learn_web_development/Core/Scripting/Build_your_own_function", "Learn_web_development/Core/Scripting")}}

Một khái niệm thiết yếu khác trong lập trình là **hàm**, cho phép bạn lưu trữ một đoạn mã thực hiện một tác vụ duy nhất bên trong một khối được định nghĩa, và sau đó gọi mã đó bất cứ khi nào bạn cần bằng một lệnh ngắn duy nhất — thay vì phải gõ cùng một đoạn mã nhiều lần. Trong bài viết này, chúng ta sẽ khám phá các khái niệm cơ bản đằng sau hàm như cú pháp cơ bản, cách gọi và định nghĩa chúng, phạm vi và tham số.

<table>
  <tbody>
    <tr>
      <th scope="row">Điều kiện tiên quyết:</th>
      <td>Hiểu biết về <a href="/en-US/docs/Learn_web_development/Core/Structuring_content">HTML</a> và <a href="/en-US/docs/Learn_web_development/Core/Styling_basics">nền tảng CSS</a>, quen thuộc với các kiến thức cơ bản về JavaScript như đã học trong các bài trước.</td>
    </tr>
    <tr>
      <th scope="row">Kết quả học tập:</th>
      <td>
        <ul>
          <li>Mục đích của hàm — để cho phép tạo ra các khối mã có thể tái sử dụng có thể được gọi bất cứ khi nào cần.</li>
          <li>Hàm được sử dụng ở khắp nơi trong JavaScript và một số được tích hợp vào trình duyệt, trong khi một số do người dùng định nghĩa.</li>
          <li>Sự khác biệt giữa hàm và phương thức.</li>
          <li>Gọi hàm.</li>
          <li>Hàm vô danh và hàm mũi tên.</li>
          <li>Định nghĩa tham số hàm, truyền đối số vào lời gọi hàm.</li>
          <li>Phạm vi toàn cục và phạm vi hàm/khối.</li>
          <li>Hiểu biết về hàm callback là gì.</li>
        </ul>
      </td>
    </tr>
  </tbody>
</table>

## Tôi tìm hàm ở đâu?

Trong JavaScript, bạn sẽ tìm thấy hàm ở khắp nơi. Thực ra, chúng ta đã sử dụng hàm xuyên suốt khóa học này; chúng ta chỉ chưa nói nhiều về chúng. Tuy nhiên, đây là lúc để chúng ta bắt đầu nói về hàm một cách rõ ràng và khám phá cú pháp của chúng.

Gần như bất cứ khi nào bạn sử dụng một cấu trúc JavaScript có một cặp dấu ngoặc đơn — `()` — và bạn **không** sử dụng một cấu trúc ngôn ngữ tích hợp phổ biến như [vòng lặp for](/en-US/docs/Learn_web_development/Core/Scripting/Loops#the_standard_for_loop), [vòng lặp while hoặc do...while](/en-US/docs/Learn_web_development/Core/Scripting/Loops#while_and_do...while), hoặc [câu lệnh if...else](/en-US/docs/Learn_web_development/Core/Scripting/Conditionals#if...else_statements), bạn đang sử dụng một hàm.

## Hàm tích hợp của trình duyệt

Chúng ta đã sử dụng nhiều hàm tích hợp của trình duyệt trong khóa học này.

Mỗi khi chúng ta thao tác với một chuỗi văn bản, ví dụ:

```js
const myText = "I am a string";
const newString = myText.replace("string", "sausage");
console.log(newString);
// the replace() string function takes a source string,
// and a target string and replaces the source string,
// with the target string, and returns the newly formed string
```

Hoặc mỗi khi chúng ta thao tác với một mảng:

```js
const myArray = ["I", "love", "chocolate", "frogs"];
const madeAString = myArray.join(" ");
console.log(madeAString);
// the join() function takes an array, joins
// all the array items together into a single
// string, and returns this new string
```

Hoặc mỗi khi chúng ta tạo một số ngẫu nhiên:

```js
const myNumber = Math.random();
// the random() function generates a random number between
// 0 and up to but not including 1, and returns that number
```

Chúng ta đã sử dụng _hàm_!

> [!NOTE]
> Hãy nhập các dòng này vào bảng điều khiển JavaScript của trình duyệt để làm quen lại với chức năng của chúng nếu cần.

Ngôn ngữ JavaScript có nhiều hàm tích hợp cho phép bạn làm các điều hữu ích mà không cần phải tự viết tất cả mã đó. Thực ra, một số mã bạn đang gọi khi **gọi** (một từ ưa thích để chỉ chạy, hoặc thực thi) một hàm tích hợp của trình duyệt không thể được viết bằng JavaScript — nhiều hàm này đang gọi các phần của mã trình duyệt nền, được viết chủ yếu bằng các ngôn ngữ hệ thống cấp thấp như C++, không phải ngôn ngữ web như JavaScript.

Hãy nhớ rằng một số hàm tích hợp của trình duyệt không phải là một phần của ngôn ngữ JavaScript cốt lõi — một số được định nghĩa như là một phần của API trình duyệt, được xây dựng trên đầu ngôn ngữ mặc định để cung cấp nhiều chức năng hơn (tham khảo [phần đầu của khóa học này](/en-US/docs/Learn_web_development/Core/Scripting/What_is_JavaScript#so_what_can_it_really_do) để biết thêm mô tả). Chúng ta sẽ xem xét việc sử dụng API trình duyệt chi tiết hơn trong một module sau.

## Hàm so với phương thức

**Hàm** là một phần của đối tượng được gọi là **phương thức**; bạn sẽ tìm hiểu về đối tượng sau trong module. Hiện tại, chúng ta chỉ muốn làm rõ mọi sự nhầm lẫn có thể về phương thức so với hàm — bạn có khả năng gặp cả hai thuật ngữ khi bạn xem các tài nguyên liên quan trên Web.

Mã tích hợp mà chúng ta đã sử dụng cho đến nay đến ở cả hai dạng: **hàm** và **phương thức.** Bạn có thể kiểm tra danh sách đầy đủ của các hàm tích hợp, cũng như các đối tượng tích hợp và phương thức tương ứng của chúng [trong tài liệu tham khảo JavaScript của chúng ta](/en-US/docs/Web/JavaScript/Reference/Global_Objects).

Bạn cũng đã thấy nhiều **hàm tùy chỉnh** trong khóa học này — các hàm được định nghĩa trong mã của bạn, không phải bên trong trình duyệt. Bất cứ khi nào bạn thấy một tên tùy chỉnh với dấu ngoặc đơn ngay sau nó, bạn đang sử dụng một hàm tùy chỉnh. Trong ví dụ [random-canvas-circles.html](https://mdn.github.io/learning-area/javascript/building-blocks/loops/random-canvas-circles.html) của chúng ta (xem thêm [mã nguồn](https://github.com/mdn/learning-area/blob/main/javascript/building-blocks/loops/random-canvas-circles.html) đầy đủ) từ [bài viết về vòng lặp](/en-US/docs/Learn_web_development/Core/Scripting/Loops), chúng ta đã bao gồm một hàm `draw()` tùy chỉnh trông như thế này:

```js
function draw() {
  ctx.clearRect(0, 0, WIDTH, HEIGHT);
  for (let i = 0; i < 100; i++) {
    ctx.beginPath();
    ctx.fillStyle = "rgb(255 0 0 / 50%)";
    ctx.arc(random(WIDTH), random(HEIGHT), random(50), 0, 2 * Math.PI);
    ctx.fill();
  }
}
```

Hàm này vẽ 100 vòng tròn ngẫu nhiên bên trong phần tử {{htmlelement("canvas")}}. Mỗi khi chúng ta muốn làm điều đó, chúng ta có thể gọi hàm với:

```js
draw();
```

thay vì phải viết lại tất cả mã đó mỗi khi chúng ta muốn lặp lại nó. Hàm có thể chứa bất kỳ mã nào bạn muốn — bạn thậm chí có thể gọi các hàm khác từ bên trong hàm. Ví dụ, hàm `draw()` ở trên gọi hàm `random()` ba lần; `random()` được định nghĩa bởi mã sau:

```js
function random(number) {
  return Math.floor(Math.random() * number);
}
```

Chúng ta cần hàm này vì hàm tích hợp [`Math.random()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/random) của trình duyệt chỉ tạo ra một số thập phân ngẫu nhiên giữa 0 và 1. Chúng ta muốn một số nguyên ngẫu nhiên giữa 0 và một số cụ thể.

## Gọi hàm

Bạn có thể đã rõ về điều này rồi, nhưng chỉ để chắc chắn, để thực sự sử dụng một hàm sau khi nó đã được định nghĩa, bạn phải chạy — hoặc gọi — nó. Điều này được thực hiện bằng cách bao gồm tên hàm trong mã ở đâu đó, theo sau là dấu ngoặc đơn.

```js
function myFunction() {
  alert("hello");
}

myFunction();
// calls the function once
```

> [!NOTE]
> Hình thức tạo hàm này còn được gọi là _khai báo hàm_. Nó luôn được hoisting nên bạn có thể gọi hàm trên định nghĩa hàm và nó sẽ hoạt động tốt.

## Tham số hàm

Một số hàm yêu cầu **tham số** được chỉ định khi bạn gọi chúng — đây là các giá trị cần được bao gồm trong dấu ngoặc đơn của hàm, mà nó cần để thực hiện công việc của mình đúng cách.

> [!NOTE]
> Tham số đôi khi được gọi là đối số, thuộc tính, hoặc thậm chí thuộc tính.

Ví dụ, hàm tích hợp [`Math.random()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/random) của trình duyệt không yêu cầu bất kỳ tham số nào. Khi được gọi, nó luôn trả về một số ngẫu nhiên giữa 0 và 1:

```js
const myNumber = Math.random();
```

Tuy nhiên, hàm chuỗi [`replace()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/replace) tích hợp của trình duyệt cần hai tham số — chuỗi con cần tìm trong chuỗi chính, và chuỗi con để thay thế chuỗi đó:

```js
const myText = "I am a string";
const newString = myText.replace("string", "sausage");
```

> [!NOTE]
> Khi bạn cần chỉ định nhiều tham số, bạn phân cách chúng bằng dấu phẩy.

### Tham số tùy chọn

Đôi khi tham số là tùy chọn — bạn không phải chỉ định chúng. Nếu bạn không làm vậy, hàm thường áp dụng một số hành vi mặc định. Ví dụ, tham số của hàm [`join()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/join) của mảng là tùy chọn:

```js
const myArray = ["I", "love", "chocolate", "frogs"];
const madeAString = myArray.join(" ");
console.log(madeAString);
// returns 'I love chocolate frogs'

const madeAnotherString = myArray.join();
console.log(madeAnotherString);
// returns 'I,love,chocolate,frogs'
```

Nếu không có tham số nào được đưa vào để chỉ định ký tự nối/phân cách, thì dấu phẩy được sử dụng theo mặc định.

### Tham số mặc định

Nếu bạn đang viết một hàm và muốn hỗ trợ tham số tùy chọn, bạn có thể chỉ định giá trị mặc định bằng cách thêm `=` sau tên của tham số, theo sau là giá trị mặc định:

```js
function hello(name = "Chris") {
  console.log(`Hello ${name}!`);
}

hello("Ari"); // Hello Ari!
hello(); // Hello Chris!
```

## Hàm vô danh và hàm mũi tên

Cho đến nay, chúng ta chỉ tạo hàm như thế này:

```js
function myFunction() {
  alert("hello");
}
```

Nhưng bạn cũng có thể tạo một hàm không có tên:

```js
(function () {
  alert("hello");
});
```

Đây được gọi là **hàm vô danh**, vì nó không có tên. Bạn sẽ thường thấy hàm vô danh khi một hàm cần nhận một hàm khác làm tham số. Trong trường hợp này, tham số hàm thường được truyền dưới dạng hàm vô danh.

> [!NOTE]
> Hình thức tạo hàm này còn được gọi là _biểu thức hàm_. Không giống như khai báo hàm, biểu thức hàm không được hoisting.

### Ví dụ hàm vô danh

Ví dụ, giả sử bạn muốn chạy một số mã khi người dùng gõ vào ô nhập văn bản. Để làm điều này, bạn có thể gọi hàm {{domxref("EventTarget/addEventListener", "addEventListener()")}} của ô nhập văn bản. Hàm này mong bạn truyền cho nó ít nhất hai tham số:

- Tên của sự kiện cần lắng nghe, trong trường hợp này là {{domxref("Element/keydown_event", "keydown")}}
- Một hàm sẽ chạy khi sự kiện xảy ra.

Khi người dùng nhấn một phím, trình duyệt sẽ gọi hàm bạn đã cung cấp, và truyền cho nó một tham số chứa thông tin về sự kiện này, bao gồm phím cụ thể mà người dùng đã nhấn:

```js
function logKey(event) {
  console.log(`You pressed "${event.key}".`);
}

textBox.addEventListener("keydown", logKey);
```

Thay vì định nghĩa một hàm `logKey()` riêng biệt, bạn có thể truyền một hàm vô danh vào `addEventListener()`:

```js
textBox.addEventListener("keydown", function (event) {
  console.log(`You pressed "${event.key}".`);
});
```

### Hàm mũi tên

Nếu bạn truyền một hàm vô danh như thế này, có một dạng thay thế bạn có thể sử dụng, được gọi là **hàm mũi tên**. Thay vì `function(event)`, bạn viết `(event) =>`:

```js
textBox.addEventListener("keydown", (event) => {
  console.log(`You pressed "${event.key}".`);
});
```

Nếu hàm chỉ có một tham số, bạn có thể bỏ qua dấu ngoặc đơn quanh tham số:

```js-nolint
textBox.addEventListener("keydown", event => {
  console.log(`You pressed "${event.key}".`);
});
```

Cuối cùng, nếu hàm của bạn chỉ chứa một dòng là câu lệnh `return`, bạn cũng có thể bỏ qua dấu ngoặc nhọn và từ khóa `return` và ngầm trả về biểu thức. Trong ví dụ sau, chúng ta đang sử dụng phương thức {{jsxref("Array.prototype.map()","map()")}} của `Array` để nhân đôi mọi giá trị trong mảng gốc:

```js-nolint
const originals = [1, 2, 3];

const doubled = originals.map(item => item * 2);

console.log(doubled); // [2, 4, 6]
```

Phương thức `map()` truyền từng mục trong mảng vào hàm đã cho, sau đó lấy giá trị được trả về bởi hàm và thêm nó vào một mảng mới.

Hàm mũi tên rất ngắn gọn; viết lại mã `map()` của chúng ta để sử dụng hàm callback vô danh thông thường sẽ trông như thế này:

```js
const doubled = originals.map(function (item) {
  return item * 2;
});
```

Bạn có thể sử dụng cú pháp hàm mũi tên ngắn gọn tương tự để viết lại ví dụ `addEventListener()`:

```js-nolint
textBox.addEventListener("keydown", (event) =>
  console.log(`You pressed "${event.key}".`)
);
```

Trong trường hợp này, giá trị của `console.log()`, là `undefined`, được trả về ngầm từ hàm callback.

Chúng ta khuyến nghị sử dụng hàm mũi tên vì chúng có thể làm cho mã của bạn ngắn hơn và dễ đọc hơn. Để tìm hiểu thêm, hãy xem [phần về hàm mũi tên trong hướng dẫn JavaScript](/en-US/docs/Web/JavaScript/Guide/Functions#arrow_functions), và [trang tham chiếu của chúng ta về hàm mũi tên](/en-US/docs/Web/JavaScript/Reference/Functions/Arrow_functions).

> [!NOTE]
> Có một số khác biệt tinh tế giữa hàm mũi tên và hàm thông thường. Chúng nằm ngoài phạm vi của hướng dẫn giới thiệu này và không có khả năng tạo ra sự khác biệt trong các trường hợp chúng ta đã thảo luận ở đây. Để tìm hiểu thêm, hãy xem [tài liệu tham chiếu hàm mũi tên](/en-US/docs/Web/JavaScript/Reference/Functions/Arrow_functions).

### Ví dụ hàm mũi tên trực tiếp

Đây là phiên bản hoàn chỉnh hoạt động của ví dụ `keydown` chúng ta đã thảo luận ở trên:

HTML:

```html
<input id="textBox" type="text" />
<div id="output"></div>
```

JavaScript:

```js
const textBox = document.querySelector("#textBox");
const output = document.querySelector("#output");

textBox.addEventListener("keydown", (event) => {
  output.textContent = `You pressed "${event.key}".`;
});
```

```css hidden
div {
  margin: 0.5rem 0;
}
```

Kết quả — hãy thử gõ vào ô nhập văn bản và xem đầu ra:

{{EmbedLiveSample("Arrow function live sample", 100, 100)}}

## Phạm vi hàm và xung đột

Hãy nói một chút về {{glossary("scope")}} — một khái niệm quan trọng khi xử lý hàm. Khi bạn tạo một hàm, các biến và những thứ khác được định nghĩa bên trong hàm nằm trong **phạm vi** riêng biệt của chúng. Điều này có nghĩa là chúng bị khóa trong khoang riêng biệt của chúng, không thể tiếp cận từ mã bên ngoài hàm.

Cấp cao nhất bên ngoài tất cả các hàm của bạn được gọi là **phạm vi toàn cục**. Các giá trị được định nghĩa trong phạm vi toàn cục có thể truy cập từ mọi nơi trong mã.

JavaScript hoạt động như thế này chủ yếu vì lý do bảo mật và tổ chức. Đôi khi bạn không muốn các biến có thể truy cập từ khắp nơi trong mã. Các script bên ngoài được gọi từ nơi khác có thể bắt đầu can thiệp vào mã của bạn và gây ra vấn đề nếu chúng sử dụng cùng tên biến, gây ra xung đột. Điều này có thể được thực hiện một cách cố ý hoặc chỉ vô tình.

Ví dụ, giả sử bạn có một tệp HTML tham chiếu hai tệp JavaScript bên ngoài, và cả hai đều có một biến và một hàm được định nghĩa sử dụng cùng tên:

```html
<!-- Excerpt from the HTML -->
<script src="first.js"></script>
<script src="second.js"></script>
<script>
  greeting();
</script>
```

```js
// first.js
const name = "Chris";
function greeting() {
  alert(`Hello ${name}: welcome to our company.`);
}
```

```js
// second.js
const name = "Zaptec";
function greeting() {
  alert(`Our company is called ${name}.`);
}
```

Bạn có thể xem ví dụ này [chạy trực tiếp trên GitHub](https://mdn.github.io/learning-area/javascript/building-blocks/functions/conflict.html) (xem thêm [mã nguồn](https://github.com/mdn/learning-area/tree/main/javascript/building-blocks/functions)). Tải nó trong một tab trình duyệt riêng biệt trước khi đọc phần giải thích bên dưới.

- Khi ví dụ hiển thị trong trình duyệt, trước tiên bạn sẽ thấy hộp cảnh báo hiển thị `Hello Chris: welcome to our company.`, có nghĩa là hàm `greeting()` được định nghĩa bên trong tệp script đầu tiên đã được gọi bởi lệnh gọi `greeting()` bên trong script nội bộ.

- Tuy nhiên, script thứ hai hoàn toàn không tải và chạy, và một lỗi được in trong bảng điều khiển: `Uncaught SyntaxError: Identifier 'name' has already been declared`. Điều này là vì hằng số `name` đã được khai báo trong `first.js`, và bạn không thể khai báo cùng một hằng số hai lần trong cùng một phạm vi. Vì script thứ hai không tải, hàm `greeting()` từ `second.js` không có sẵn để gọi.

- Nếu chúng ta xóa dòng `const name = "Zaptec";` khỏi `second.js` và tải lại trang, cả hai script sẽ thực thi. Hộp cảnh báo bây giờ sẽ nói `Our company is called Chris.` Nếu một hàm được _khai báo lại_, khai báo cuối cùng trong thứ tự nguồn được sử dụng. Các khai báo trước đó thực sự bị ghi đè.

Khóa các phần của mã của bạn vào trong hàm tránh các vấn đề như vậy và được coi là thực hành tốt nhất.

Nó giống như một vườn thú. Sư tử, ngựa vằn, hổ và chim cánh cụt được giữ trong các khu vực riêng của chúng và chỉ có quyền truy cập vào những thứ bên trong, tương tự như phạm vi hàm. Nếu chúng có thể vào các khu vực khác, sẽ xảy ra vấn đề. Ít nhất, các động vật khác nhau sẽ cảm thấy thực sự không thoải mái trong môi trường không quen thuộc — một con sư tử hoặc hổ sẽ cảm thấy kinh khủng trong môi trường nước và băng của chim cánh cụt. Tệ nhất, sư tử và hổ có thể cố gắng ăn chim cánh cụt!

![Bốn loài động vật khác nhau được giam giữ trong môi trường sống tương ứng trong vườn thú](mdn-mozilla-zoo.png)

Người giám hộ vườn thú giống như phạm vi toàn cục — họ có chìa khóa để truy cập mọi khu vực, bổ sung thức ăn, chăm sóc động vật bệnh, v.v.

### Chơi với phạm vi

Hãy xem một ví dụ thực tế để minh họa phạm vi.

1. Đầu tiên, tạo một bản sao local của ví dụ [function-scope.html](https://github.com/mdn/learning-area/blob/main/javascript/building-blocks/functions/function-scope.html). Nó chứa hai hàm gọi là `a()` và `b()`, và ba biến — `x`, `y`, và `z` — hai trong số đó được định nghĩa bên trong các hàm, và một trong phạm vi toàn cục. Nó cũng chứa hàm thứ ba gọi là `output()`, nhận một tham số duy nhất và xuất nó ra một đoạn văn trên trang.
2. Mở ví dụ trong trình duyệt và trong trình soạn thảo văn bản của bạn.
3. Mở bảng điều khiển JavaScript trong công cụ nhà phát triển trình duyệt của bạn. Trong bảng điều khiển JavaScript, nhập lệnh sau:

   ```js
   output(x);
   ```

   Bạn sẽ thấy giá trị của biến `x` được in ra khung nhìn trình duyệt.

4. Bây giờ hãy thử nhập những thứ sau trong bảng điều khiển của bạn

   ```js
   output(y);
   output(z);
   ```

   Cả hai nên ném lỗi vào bảng điều khiển theo kiểu "[ReferenceError: y is not defined](/en-US/docs/Web/JavaScript/Reference/Errors/Not_defined)". Tại sao như vậy? Vì phạm vi hàm: `y` và `z` bị khóa bên trong các hàm `a()` và `b()`, vì vậy `output()` không thể truy cập chúng khi được gọi từ phạm vi toàn cục.

5. Tuy nhiên, thế nào khi nó được gọi từ bên trong một hàm khác? Hãy thử chỉnh sửa `a()` và `b()` để chúng trông như thế này:

   ```js
   function a() {
     const y = 2;
     output(y);
   }

   function b() {
     const z = 3;
     output(z);
   }
   ```

   Lưu mã và tải lại nó trong trình duyệt của bạn, sau đó thử gọi các hàm `a()` và `b()` từ bảng điều khiển JavaScript:

   ```js
   a();
   b();
   ```

   Bạn sẽ thấy các giá trị `y` và `z` được in trong khung nhìn trình duyệt. Điều này hoạt động tốt, vì hàm `output()` được gọi bên trong các hàm khác, trong cùng phạm vi với các biến mà nó in được định nghĩa. `output()` chính nó có sẵn từ mọi nơi, vì nó được định nghĩa trong phạm vi toàn cục.

6. Bây giờ hãy thử cập nhật mã như thế này:

   ```js
   function a() {
     const y = 2;
     output(x);
   }

   function b() {
     const z = 3;
     output(x);
   }
   ```

7. Lưu và tải lại một lần nữa, và thử lại trong bảng điều khiển JavaScript của bạn:

   ```js
   a();
   b();
   ```

   Cả hai lệnh gọi `a()` và `b()` nên in giá trị của x ra khung nhìn trình duyệt. Điều này hoạt động tốt vì mặc dù các lệnh gọi `output()` không trong cùng phạm vi với nơi `x` được định nghĩa, `x` là biến toàn cục — nó có sẵn bên trong tất cả mã, ở khắp mọi nơi.

8. Cuối cùng, hãy thử cập nhật mã như thế này:

   ```js
   function a() {
     const y = 2;
     output(z);
   }

   function b() {
     const z = 3;
     output(y);
   }
   ```

9. Lưu và tải lại một lần nữa, và thử lại trong bảng điều khiển JavaScript của bạn:

   ```js
   a();
   b();
   ```

   Lần này các lệnh gọi `a()` và `b()` sẽ ném lỗi [ReferenceError: _tên biến_ is not defined](/en-US/docs/Web/JavaScript/Reference/Errors/Not_defined) khó chịu đó vào bảng điều khiển — điều này là vì các lệnh gọi `output()` và các biến chúng đang cố gắng in không trong cùng phạm vi hàm — các biến thực sự vô hình với các lệnh gọi hàm đó.

> [!NOTE]
> Lỗi [ReferenceError: "x" is not defined](/en-US/docs/Web/JavaScript/Reference/Errors/Not_defined) là một trong những lỗi phổ biến nhất bạn sẽ gặp. Nếu bạn gặp lỗi này và bạn chắc chắn rằng bạn đã định nghĩa biến đó, hãy kiểm tra phạm vi của nó.

#### Ghi chú về phạm vi của vòng lặp và điều kiện

Đáng chú ý rằng phạm vi của các giá trị được khai báo bên trong [câu lệnh điều kiện](/en-US/docs/Learn_web_development/Core/Scripting/Conditionals) và [vòng lặp](/en-US/docs/Learn_web_development/Core/Scripting/Loops) hoạt động giống như phạm vi hàm khi khai báo các giá trị với `let` và `const`. Ví dụ, nếu bạn thêm các khối sau vào ví dụ trên:

```js
if (x === 1) {
  const c = 4;
  let d = 5;
}

for (let i = 0; i <= 1; i++) {
  const e = 6;
  let f = 7;
}
```

Gọi `output(c)`, `output(d)`, `output(e)`, hoặc `output(f)` sẽ dẫn đến lỗi **"ReferenceError: [tên-biến] is not defined"** như đã thấy trước đó. Hàm `output()` không thể truy cập các biến này vì chúng bị khóa trong phạm vi riêng của chúng.

Từ khóa `var` cũ hoạt động khác. Nếu `c`, `d`, `e`, và `f` được khai báo sử dụng `var`:

```js
if (x === 1) {
  var c = 4;
  var d = 5;
}

for (let i = 0; i <= 1; i++) {
  var e = 6;
  var f = 7;
}
```

chúng sẽ được hoisting lên phạm vi toàn cục; do đó, xuất chúng ra bảng điều khiển (ví dụ, với `output(c)`) sẽ hoạt động. Tuy nhiên, các biến được khai báo với `var` bên trong hàm vẫn có phạm vi giới hạn trong các hàm đó.

Sự không nhất quán này có thể gây nhầm lẫn và lỗi, và là một lý do khác tại sao bạn nên sử dụng `let` và `const` thay vì `var`.

## Tóm tắt

Bài viết này đã khám phá các khái niệm cơ bản đằng sau hàm, mở đường cho bài tiếp theo, trong đó chúng ta sẽ thực hành và hướng dẫn bạn qua các bước để xây dựng hàm tùy chỉnh của riêng bạn.

## Xem thêm

- [Hướng dẫn chi tiết về hàm](/en-US/docs/Web/JavaScript/Guide/Functions) — bao gồm một số tính năng nâng cao không được đề cập ở đây.
- [Tham chiếu hàm](/en-US/docs/Web/JavaScript/Reference/Functions)
- [Sử dụng hàm để viết ít mã hơn](https://scrimba.com/the-frontend-developer-career-path-c0j/~04g?via=mdn), Scrimba <sup>[_Đối tác học MDN_](/en-US/docs/MDN/Writing_guidelines/Learning_content#partner_links_and_embeds)</sup> - Một bài học tương tác cung cấp giới thiệu hàm hữu ích.

{{PreviousMenuNext("Learn_web_development/Core/Scripting/Test_your_skills/Loops","Learn_web_development/Core/Scripting/Build_your_own_function", "Learn_web_development/Core/Scripting")}}
