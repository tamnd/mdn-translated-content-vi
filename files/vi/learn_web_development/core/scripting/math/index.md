---
title: Toán học cơ bản trong JavaScript — số và toán tử
short-title: Số và toán tử
slug: Learn_web_development/Core/Scripting/Math
page-type: learn-module-chapter
sidebar: learnsidebar
---

{{PreviousMenuNext("Learn_web_development/Core/Scripting/Test_your_skills/Variables", "Learn_web_development/Core/Scripting/Test_your_skills/Math", "Learn_web_development/Core/Scripting")}}

Ở điểm này trong khóa học, chúng ta thảo luận về toán học trong JavaScript — cách chúng ta có thể sử dụng {{Glossary("Operator","các toán tử")}} và các tính năng khác để thao tác thành công với các con số theo ý muốn.

<table>
  <tbody>
    <tr>
      <th scope="row">Điều kiện tiên quyết:</th>
      <td>Hiểu biết về <a href="/en-US/docs/Learn_web_development/Core/Structuring_content">HTML</a> và <a href="/en-US/docs/Learn_web_development/Core/Styling_basics">các nguyên tắc cơ bản của CSS</a>.</td>
    </tr>
    <tr>
      <th scope="row">Kết quả học tập:</th>
      <td>
        <ul>
          <li>Các phép toán số cơ bản trong JavaScript — cộng, trừ, nhân và chia.</li>
          <li>Số không phải là số nếu chúng được định nghĩa là chuỗi, và có thể khiến các phép tính bị sai.</li>
          <li>Chuyển đổi chuỗi thành số với <code>Number()</code>.</li>
          <li>Thứ tự ưu tiên của toán tử.</li>
          <li>Tăng và giảm.</li>
          <li>Toán tử gán và so sánh.</li>
          <li>Các phương thức đối tượng Math cơ bản, chẳng hạn như <code>Math.random()</code>, <code>Math.floor()</code> và <code>Math.ceil()</code>.</li>
        </ul>
      </td>
    </tr>
  </tbody>
</table>

## Mọi người đều thích toán học

Được rồi, có thể không phải. Một số người trong chúng ta thích toán học, một số người đã ghét toán học kể từ khi chúng ta phải học bảng nhân và phép chia dài ở trường, và một số người nằm ở đâu đó giữa hai thái cực đó. Nhưng không ai trong chúng ta có thể phủ nhận rằng toán học là một phần cơ bản của cuộc sống mà chúng ta không thể tiến xa mà không có. Điều này đặc biệt đúng khi chúng ta đang học lập trình JavaScript (hoặc bất kỳ ngôn ngữ nào khác cho vấn đề đó) — nhiều việc chúng ta làm dựa vào việc xử lý dữ liệu số, tính toán các giá trị mới, v.v., và bạn sẽ không ngạc nhiên khi biết rằng JavaScript có một bộ các hàm toán học đầy đủ tính năng.

Bài viết này chỉ thảo luận về những phần cơ bản mà bạn cần biết ngay bây giờ.

### Các kiểu số

Trong lập trình, ngay cả hệ thống số thập phân khiêm tốn mà tất cả chúng ta đều biết rõ cũng phức tạp hơn bạn có thể nghĩ. Chúng ta sử dụng các thuật ngữ khác nhau để mô tả các kiểu số thập phân khác nhau, ví dụ:

- **Số nguyên** là những số không có phần thập phân. Chúng có thể là dương hoặc âm, ví dụ: 10, 400 hoặc -5.
- **Số dấu phẩy động** (số thực) có dấu chấm thập phân và chữ số thập phân, ví dụ: 12.5 và 56.7786543.

Chúng ta thậm chí có các loại hệ thống số khác nhau! Thập phân là cơ số 10 (có nghĩa là nó sử dụng 0–9 ở mỗi chữ số), nhưng chúng ta cũng có những thứ như:

- **Nhị phân** — Ngôn ngữ cấp thấp nhất của máy tính; 0 và 1.
- **Bát phân** — Cơ số 8, sử dụng 0–7 ở mỗi chữ số.
- **Thập lục phân** — Cơ số 16, sử dụng 0–9 và sau đó a–f ở mỗi chữ số. Bạn có thể đã gặp những số này trước đây khi thiết lập [màu sắc trong CSS](/en-US/docs/Learn_web_development/Core/Styling_basics/Values_and_units#hexadecimal_rgb_values).

**Trước khi bạn bắt đầu lo lắng não của mình sẽ tan chảy, hãy dừng lại!** Để bắt đầu, chúng ta sẽ chỉ gắn bó với số thập phân trong suốt khóa học này; bạn hiếm khi gặp nhu cầu bắt đầu suy nghĩ về các kiểu khác, nếu có.

Tin tốt thứ hai là không giống như một số ngôn ngữ lập trình khác, JavaScript chỉ có một kiểu dữ liệu cho số, cả số nguyên và thập phân — bạn đoán đúng, {{jsxref("Number")}}. Điều này có nghĩa là dù kiểu số nào bạn đang xử lý trong JavaScript, bạn xử lý chúng theo cùng một cách.

> [!NOTE]
> Thực ra, JavaScript có kiểu số thứ hai, {{Glossary("BigInt")}}, được sử dụng cho các số nguyên rất, rất lớn. Nhưng cho mục đích của khóa học này, chúng ta sẽ chỉ lo lắng về các giá trị `Number`.

### Tất cả chỉ là số đối với tôi

Hãy nhanh chóng chơi với một số con số để làm quen lại với cú pháp cơ bản mà chúng ta cần. Nhập các lệnh được liệt kê bên dưới vào [bảng điều khiển (console) JavaScript công cụ dành cho nhà phát triển](/en-US/docs/Learn_web_development/Howto/Tools_and_setup/What_are_browser_developer_tools) của bạn.

1. Đầu tiên hãy khai báo một vài biến và khởi tạo chúng với một số nguyên và một số thực, tương ứng, sau đó gõ lại tên biến để kiểm tra xem mọi thứ có đúng thứ tự không:

   ```js
   const myInt = 5;
   const myFloat = 6.667;
   myInt;
   myFloat;
   ```

2. Giá trị số được gõ mà không có dấu nháy — hãy thử khai báo và khởi tạo thêm một vài biến chứa số trước khi bạn tiếp tục.
3. Bây giờ hãy kiểm tra rằng cả hai biến gốc của chúng ta đều có cùng kiểu dữ liệu. Có một toán tử gọi là {{jsxref("Operators/typeof", "typeof")}} trong JavaScript thực hiện điều này. Nhập hai dòng bên dưới như hiển thị:

   ```js
   typeof myInt;
   typeof myFloat;
   ```

   Bạn sẽ nhận được `"number"` được trả về trong cả hai trường hợp — điều này làm mọi thứ trở nên dễ dàng hơn cho chúng ta so với nếu các số khác nhau có các kiểu dữ liệu khác nhau, và chúng ta phải xử lý chúng theo những cách khác nhau. Phew!

### Các phương thức Number hữu ích

Đối tượng [`Number`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number), một thể hiện đại diện cho tất cả các số tiêu chuẩn bạn sẽ sử dụng trong JavaScript của mình, có một số phương thức hữu ích cho bạn để thao tác số. Chúng ta không đề cập chi tiết trong bài này vì chúng ta muốn giữ nó như là phần giới thiệu và chỉ đề cập những điều thiết yếu cơ bản thực sự cho bây giờ; tuy nhiên, khi bạn đã đọc qua mô-đun này một vài lần, hãy đến trang tham chiếu đối tượng và tìm hiểu thêm về những gì có sẵn.

Ví dụ, để làm tròn số của bạn đến một số chữ số thập phân cố định, hãy sử dụng phương thức [`toFixed()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number/toFixed). Gõ các dòng sau vào [bảng điều khiển (console)](https://firefox-source-docs.mozilla.org/devtools-user/web_console/index.html) của trình duyệt của bạn:

```js
const lotsOfDecimal = 1.7665849587;
lotsOfDecimal;
const twoDecimalPlaces = lotsOfDecimal.toFixed(2);
twoDecimalPlaces;
```

### Chuyển đổi sang kiểu dữ liệu số

Đôi khi bạn có thể kết thúc với một số được lưu trữ như kiểu chuỗi, điều này làm cho việc thực hiện các phép tính với nó trở nên khó khăn. Điều này thường xảy ra nhất khi dữ liệu được nhập vào ô nhập liệu của [biểu mẫu](/en-US/docs/Learn_web_development/Extensions/Forms), và [kiểu nhập liệu là text](/en-US/docs/Web/HTML/Reference/Elements/input/text). Có một cách để giải quyết vấn đề này — truyền giá trị chuỗi vào hàm tạo [`Number()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number/Number) để trả về phiên bản số của cùng giá trị đó.

Ví dụ, hãy thử gõ những dòng này vào bảng điều khiển (console) của bạn:

```js
let myNumber = "74";
myNumber += 3;
```

Bạn kết thúc với kết quả 743, không phải 77, vì `myNumber` thực sự được định nghĩa là chuỗi. Bạn có thể kiểm tra điều này bằng cách gõ vào:

```js
typeof myNumber;
```

Để sửa phép tính, bạn có thể làm điều này:

```js
let myNumber = "74";
myNumber = Number(myNumber) + 3;
```

Kết quả là 77, như mong đợi ban đầu.

## Toán tử số học

Toán tử số học được sử dụng để thực hiện các phép tính toán học trong JavaScript:

<table class="standard-table">
  <thead>
    <tr>
      <th scope="col">Toán tử</th>
      <th scope="col">Tên</th>
      <th scope="col">Mục đích</th>
      <th scope="col">Ví dụ</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><code>+</code></td>
      <td>Cộng</td>
      <td>Cộng hai số lại với nhau.</td>
      <td><code>6 + 9</code></td>
    </tr>
    <tr>
      <td><code>-</code></td>
      <td>Trừ</td>
      <td>Trừ số bên phải khỏi số bên trái.</td>
      <td><code>20 - 15</code></td>
    </tr>
    <tr>
      <td><code>*</code></td>
      <td>Nhân</td>
      <td>Nhân hai số lại với nhau.</td>
      <td><code>3 * 7</code></td>
    </tr>
    <tr>
      <td><code>/</code></td>
      <td>Chia</td>
      <td>Chia số bên trái cho số bên phải.</td>
      <td><code>10 / 5</code></td>
    </tr>
    <tr>
      <td><code>%</code></td>
      <td>Phần dư (đôi khi gọi là modulo)</td>
      <td>
        <p>
          Trả về phần dư còn lại sau khi bạn đã chia số bên trái cho một số phần nguyên bằng số bên phải.
        </p>
      </td>
      <td>
        <p>
          <code>8 % 3</code> (trả về 2, vì 3 vào 8 hai lần, còn lại 2).
        </p>
      </td>
    </tr>
    <tr>
      <td><code>**</code></td>
      <td>Lũy thừa</td>
      <td>
        Nâng một số <code>cơ số</code> lên lũy thừa <code>số mũ</code>,
        tức là, số <code>cơ số</code> nhân với chính nó,
        <code>số mũ</code> lần.
      </td>
      <td>
        <code>5 ** 2</code> (trả về <code>25</code>, bằng
        <code>5 * 5</code>).
      </td>
    </tr>
  </tbody>
</table>

> [!NOTE]
> Đôi khi bạn sẽ thấy các số tham gia vào phép tính số học được gọi là {{Glossary("Operand", "toán hạng")}}.

> [!NOTE]
> Đôi khi bạn có thể thấy các số mũ được biểu diễn bằng phương thức {{jsxref("Math.pow()")}} cũ hơn, hoạt động theo cách rất tương tự. Ví dụ, trong `Math.pow(7, 3)`, `7` là cơ số và `3` là số mũ, vì vậy kết quả của biểu thức là `343`. `Math.pow(7, 3)` tương đương với `7**3`.

Chúng ta có lẽ không cần dạy bạn cách làm toán cơ bản, nhưng chúng ta muốn kiểm tra sự hiểu biết của bạn về cú pháp liên quan. Hãy thử nhập các ví dụ bên dưới vào [bảng điều khiển (console) JavaScript công cụ dành cho nhà phát triển](/en-US/docs/Learn_web_development/Howto/Tools_and_setup/What_are_browser_developer_tools) để làm quen với cú pháp.

1. Đầu tiên hãy thử nhập một số ví dụ đơn giản của riêng bạn, chẳng hạn như

   ```js
   10 + 7;
   9 * 8;
   60 % 3;
   ```

2. Bạn cũng có thể thử khai báo và khởi tạo một số số bên trong biến, và thử sử dụng chúng trong các phép tính — các biến sẽ hoạt động chính xác như các giá trị chúng chứa cho mục đích của phép tính. Ví dụ:

   ```js
   const num1 = 10;
   const num2 = 50;
   9 * num1;
   num1 ** 3;
   num2 / num1;
   ```

3. Cuối cùng cho phần này, hãy thử nhập thêm một số biểu thức phức tạp, chẳng hạn như:

   ```js
   5 + 10 * 3;
   (num2 % 9) * num1;
   num2 + num1 / 8 + 2;
   ```

Một số phần của tập hợp tính toán cuối cùng này có thể không cho bạn kết quả mà bạn mong đợi; phần bên dưới có thể cung cấp câu trả lời tại sao.

### Thứ tự ưu tiên của toán tử

Hãy xem ví dụ cuối cùng từ trên, giả sử rằng `num2` chứa giá trị 50 và `num1` chứa giá trị 10 (như được nêu ban đầu ở trên):

```js
num2 + num1 / 8 + 2;
```

Là một con người, bạn có thể đọc điều này là _"50 cộng 10 bằng 60"_, sau đó _"8 cộng 2 bằng 10"_, và cuối cùng _"60 chia 10 bằng 6"_.

Nhưng trình duyệt thực hiện _"10 chia 8 bằng 1.25"_, sau đó _"50 cộng 1.25 cộng 2 bằng 53.25"_.

Điều này là do **thứ tự ưu tiên của toán tử** — một số toán tử được áp dụng trước các toán tử khác khi tính toán kết quả của một phép tính (được gọi là _biểu thức_, trong lập trình). Thứ tự ưu tiên của toán tử trong JavaScript giống như được dạy trong các lớp toán ở trường — nhân và chia luôn được thực hiện trước, sau đó cộng và trừ (phép tính luôn được đánh giá từ trái sang phải).

Nếu bạn muốn ghi đè thứ tự ưu tiên của toán tử, bạn có thể đặt dấu ngoặc đơn xung quanh các phần mà bạn muốn được xử lý rõ ràng trước. Vì vậy, để có kết quả là 6, chúng ta có thể làm điều này:

```js
(num2 + num1) / (8 + 2);
```

Hãy thử nhập dòng trước vào bảng điều khiển (console) để kiểm tra điều này.

> [!NOTE]
> Danh sách đầy đủ tất cả các toán tử JavaScript và thứ tự ưu tiên của chúng có thể được tìm thấy trong [Thứ tự ưu tiên toán tử](/en-US/docs/Web/JavaScript/Reference/Operators/Operator_precedence).

## Toán tử tăng và giảm

Đôi khi bạn sẽ muốn liên tục cộng hoặc trừ một vào hoặc từ một giá trị biến số. Điều này có thể được thực hiện một cách thuận tiện bằng cách sử dụng các toán tử tăng (`++`) và giảm (`--`). Chúng ta đã sử dụng `++` trong trò chơi "Đoán số" trong bài [JavaScript lần đầu tiên](/en-US/docs/Learn_web_development/Core/Scripting/A_first_splash), khi chúng ta thêm 1 vào biến `guessCount` của mình để theo dõi người dùng còn lại bao nhiêu lượt đoán sau mỗi lượt.

```js
guessCount++;
```

Hãy thử chơi với những thứ này trong bảng điều khiển (console) của bạn. Để bắt đầu, hãy lưu ý rằng bạn không thể áp dụng những thứ này trực tiếp cho một số, điều này có thể có vẻ lạ, nhưng chúng ta đang gán cho biến một giá trị mới được cập nhật, không thao tác trên giá trị bản thân. Đoạn sau sẽ trả về một lỗi:

```js example-bad
3++;
```

Vì vậy, bạn chỉ có thể tăng một biến hiện có. Hãy thử điều này:

```js
let num1 = 4;
num1++;
```

Được rồi, điều kỳ lạ số 2! Khi bạn làm điều này, bạn sẽ thấy một giá trị 4 được trả về — điều này là vì trình duyệt trả về giá trị hiện tại, _sau đó_ tăng biến. Bạn có thể thấy rằng nó đã được tăng lên nếu bạn trả lại giá trị biến một lần nữa:

```js
num1;
```

Điều tương tự đúng với `--`: hãy thử đoạn sau

```js
let num2 = 6;
num2--;
num2;
```

> [!NOTE]
> Bạn có thể làm cho trình duyệt làm ngược lại — tăng/giảm biến _sau đó_ trả về giá trị — bằng cách đặt toán tử ở đầu biến thay vì ở cuối. Hãy thử lại các ví dụ trên, nhưng lần này sử dụng `++num1` và `--num2`.

## Toán tử gán

Toán tử gán là những toán tử gán một giá trị cho một biến. Chúng ta đã sử dụng toán tử cơ bản nhất, `=`, nhiều lần — nó gán cho biến ở bên trái giá trị được nêu ở bên phải:

```js
let x = 3; // x contains the value 3
let y = 4; // y contains the value 4
x = y; // x now contains the same value y contains, 4
```

Nhưng có một số kiểu phức tạp hơn, cung cấp các phím tắt hữu ích để giữ cho mã của bạn gọn gàng và hiệu quả hơn. Những cái phổ biến nhất được liệt kê bên dưới:

<table class="standard-table no-markdown">
  <thead>
    <tr>
      <th scope="col">Toán tử</th>
      <th scope="col">Tên</th>
      <th scope="col">Mục đích</th>
      <th scope="col">Ví dụ</th>
      <th scope="col">Tương đương với</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><code>+=</code></td>
      <td>Gán cộng</td>
      <td>
        Cộng giá trị bên phải vào giá trị biến bên trái, sau đó
        trả về giá trị biến mới
      </td>
      <td><code>x += 4;</code></td>
      <td><code>x = x + 4;</code></td>
    </tr>
    <tr>
      <td><code>-=</code></td>
      <td>Gán trừ</td>
      <td>
        Trừ giá trị bên phải khỏi giá trị biến bên trái,
        và trả về giá trị biến mới
      </td>
      <td><code>x -= 3;</code></td>
      <td><code>x = x - 3;</code></td>
    </tr>
    <tr>
      <td><code>*=</code></td>
      <td>Gán nhân</td>
      <td>
        Nhân giá trị biến bên trái với giá trị bên phải, và
        trả về giá trị biến mới
      </td>
      <td><code>x *= 3;</code></td>
      <td><code>x = x * 3;</code></td>
    </tr>
    <tr>
      <td><code>/=</code></td>
      <td>Gán chia</td>
      <td>
        Chia giá trị biến bên trái cho giá trị bên phải, và
        trả về giá trị biến mới
      </td>
      <td><code>x /= 5;</code></td>
      <td><code>x = x / 5;</code></td>
    </tr>
  </tbody>
</table>

Hãy thử gõ một số ví dụ trên vào bảng điều khiển (console) của bạn, để có ý tưởng về cách chúng hoạt động. Trong mỗi trường hợp, hãy xem liệu bạn có thể đoán giá trị là gì trước khi bạn gõ dòng thứ hai không.

Lưu ý rằng bạn hoàn toàn có thể sử dụng các biến khác ở phía bên phải của mỗi biểu thức, ví dụ:

```js
let x = 3; // x contains the value 3
let y = 4; // y contains the value 4
x *= y; // x now contains the value 12
```

> [!NOTE]
> Có rất nhiều [toán tử gán khác có sẵn](/en-US/docs/Web/JavaScript/Guide/Expressions_and_operators#assignment_operators), nhưng đây là những cái cơ bản bạn nên học ngay bây giờ.

## Định kích thước hộp canvas

Trong bài tập này, bạn sẽ thao tác với một số con số và toán tử để thay đổi kích thước hộp. Hộp được vẽ bằng API trình duyệt gọi là {{domxref("Canvas API", "", "", "true")}}. Không cần lo lắng về cách hoạt động của nó — chỉ cần tập trung vào toán học cho bây giờ. Chiều rộng và chiều cao của hộp (tính bằng pixel) được xác định bởi các biến `x` và `y`, ban đầu cả hai đều được đặt giá trị là 50.

```html hidden live-sample___canvas-exercise
<canvas id="canvas" width="400" height="200"></canvas>
<p></p>
```

```js live-sample___canvas-exercise
const canvas = document.getElementById("canvas");
const para = document.querySelector("p");
const ctx = canvas.getContext("2d");

// Edit the following two lines ONLY
let x = 50;
let y = 50;

ctx.clearRect(0, 0, canvas.width, canvas.height);
ctx.fillStyle = "green";
ctx.fillRect(10, 10, x, y);
para.textContent = `The rectangle is ${x}px wide and ${y}px high.`;
```

{{EmbedLiveSample("canvas-exercise", '100%', 300)}}

Mở ví dụ trên trong MDN Playground bằng cách nhấp vào nút **"Play"**, sau đó làm theo danh sách các hướng dẫn bên dưới để làm cho hộp lớn/nhỏ đến một số kích thước nhất định, sử dụng các toán tử và/hoặc giá trị nhất định trong mỗi trường hợp:

- Thay đổi dòng tính `x` để hộp vẫn rộng `50px`, nhưng 50 được tính bằng các số 43 và 7 và một toán tử số học.
- Thay đổi dòng tính `y` để hộp cao `75px`, nhưng 75 được tính bằng các số 25 và 3 và một toán tử số học.
- Thay đổi dòng tính `x` để hộp rộng `100px`, nhưng 100 được tính bằng ba số và các toán tử trừ và chia.
- Thay đổi dòng tính `y` để hộp cao `200px`, nhưng 200 được tính bằng các số 2 và `x` và toán tử nhân.

Đừng lo lắng nếu bạn làm hỏng mã. Bạn luôn có thể nhấn nút Reset để bắt đầu lại.

## Toán tử so sánh

Đôi khi chúng ta sẽ muốn chạy các bài kiểm tra đúng/sai, sau đó hành động phù hợp tùy thuộc vào kết quả của bài kiểm tra đó — để làm điều này, chúng ta sử dụng **toán tử so sánh**.

| Toán tử | Tên                            | Mục đích                                                                    | Ví dụ         |
| ------- | ------------------------------ | --------------------------------------------------------------------------- | ------------- |
| `===`   | So sánh bằng nghiêm ngặt       | Kiểm tra xem giá trị bên trái và bên phải có giống hệt nhau không           | `5 === 2 + 4` |
| `!==`   | So sánh không bằng nghiêm ngặt | Kiểm tra xem giá trị bên trái và bên phải có **không** giống hệt nhau không | `5 !== 2 + 3` |
| `<`     | Nhỏ hơn                        | Kiểm tra xem giá trị bên trái có nhỏ hơn giá trị bên phải không.            | `10 < 6`      |
| `>`     | Lớn hơn                        | Kiểm tra xem giá trị bên trái có lớn hơn giá trị bên phải không.            | `10 > 20`     |
| `<=`    | Nhỏ hơn hoặc bằng              | Kiểm tra xem giá trị bên trái có nhỏ hơn hoặc bằng giá trị bên phải không.  | `3 <= 2`      |
| `>=`    | Lớn hơn hoặc bằng              | Kiểm tra xem giá trị bên trái có lớn hơn hoặc bằng giá trị bên phải không.  | `5 >= 4`      |

> [!NOTE]
> Bạn có thể thấy một số người sử dụng `==` và `!=` trong các bài kiểm tra của họ cho bằng và không bằng. Đây là các toán tử hợp lệ trong JavaScript, nhưng chúng khác với `===`/`!==`. Các phiên bản trước kiểm tra xem các giá trị có giống nhau không nhưng không kiểm tra xem kiểu dữ liệu của các giá trị có giống nhau không. Các phiên bản nghiêm ngặt sau kiểm tra bình đẳng của cả giá trị và kiểu dữ liệu của chúng. Các phiên bản nghiêm ngặt có xu hướng dẫn đến ít lỗi hơn, vì vậy chúng ta khuyến nghị bạn sử dụng chúng.

Nếu bạn thử nhập một số giá trị này vào bảng điều khiển (console), bạn sẽ thấy rằng chúng đều trả về giá trị `true`/`false` — những boolean mà chúng ta đã đề cập trong bài trước. Những thứ này rất hữu ích, vì chúng cho phép chúng ta đưa ra quyết định trong mã của mình, và chúng được sử dụng mỗi khi chúng ta muốn thực hiện một lựa chọn nào đó. Ví dụ, boolean có thể được sử dụng để:

- Hiển thị nhãn văn bản đúng trên nút tùy thuộc vào tính năng được bật hay tắt
- Hiển thị thông báo game over nếu trò chơi kết thúc hoặc thông báo chiến thắng nếu trò chơi đã thắng
- Hiển thị lời chúc mừng mùa lễ đúng tùy thuộc vào mùa lễ nào
- Thu phóng bản đồ vào hoặc ra tùy thuộc vào mức độ thu phóng nào được chọn

Chúng ta sẽ xem xét cách mã hóa logic như vậy khi chúng ta xem xét câu lệnh điều kiện trong một bài tiếp theo. Hiện tại, hãy xem một ví dụ nhanh:

```html live-sample___conditional
<button>Start machine</button>
<p>The machine is stopped.</p>
```

```js live-sample___conditional
const btn = document.querySelector("button");
const txt = document.querySelector("p");

btn.addEventListener("click", updateBtn);

function updateBtn() {
  if (btn.textContent === "Start machine") {
    btn.textContent = "Stop machine";
    txt.textContent = "The machine has started!";
  } else {
    btn.textContent = "Start machine";
    txt.textContent = "The machine is stopped.";
  }
}
```

{{EmbedLiveSample("conditional", '100%', 100)}}

Bạn có thể thấy toán tử bình đẳng đang được sử dụng ngay bên trong hàm `updateBtn()`. Trong trường hợp này, chúng ta không kiểm tra xem hai biểu thức toán học có cùng giá trị hay không — chúng ta đang kiểm tra xem nội dung văn bản của nút có chứa một chuỗi nhất định hay không — nhưng nguyên tắc vẫn như nhau. Nếu nút hiện đang nói "Start machine" khi được nhấn, chúng ta thay đổi nhãn của nó thành "Stop machine", và cập nhật nhãn thích hợp. Nếu nút hiện đang nói "Stop machine" khi được nhấn, chúng ta đổi lại màn hình.

> [!NOTE]
> Một điều khiển như vậy chuyển đổi giữa hai trạng thái thường được gọi là **toggle**. Nó chuyển đổi giữa một trạng thái và trạng thái khác — đèn bật, đèn tắt, v.v.

## Tóm tắt

Trong bài này, chúng ta đã đề cập đến thông tin cơ bản mà bạn cần biết về số trong JavaScript, bây giờ. Bạn sẽ thấy số được sử dụng lặp đi lặp lại, trong suốt quá trình học JavaScript của bạn, vì vậy đây là ý tưởng tốt để làm quen với điều này ngay bây giờ. Nếu bạn là một trong những người không thích toán học, bạn có thể lấy sự an ủi từ thực tế rằng chương này khá ngắn.

Trong bài tiếp theo, chúng ta sẽ cung cấp cho bạn một số bài kiểm tra mà bạn có thể sử dụng để kiểm tra mức độ hiểu biết và ghi nhớ thông tin này của bạn.

## Xem thêm

- [Số và chuỗi](/en-US/docs/Web/JavaScript/Guide/Numbers_and_strings)
- [Biểu thức và toán tử](/en-US/docs/Web/JavaScript/Guide/Expressions_and_operators)

{{PreviousMenuNext("Learn_web_development/Core/Scripting/Test_your_skills/Variables", "Learn_web_development/Core/Scripting/Test_your_skills/Math", "Learn_web_development/Core/Scripting")}}
