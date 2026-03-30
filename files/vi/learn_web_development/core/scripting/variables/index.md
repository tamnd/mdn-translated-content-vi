---
title: Lưu trữ thông tin bạn cần — Biến
short-title: Biến
slug: Learn_web_development/Core/Scripting/Variables
page-type: learn-module-chapter
sidebar: learnsidebar
---

{{PreviousMenuNext("Learn_web_development/Core/Scripting/What_went_wrong", "Learn_web_development/Core/Scripting/Test_your_skills/Variables", "Learn_web_development/Core/Scripting")}}

Sau khi đọc các bài trước, bây giờ bạn nên biết JavaScript là gì, nó có thể làm gì cho bạn, cách sử dụng nó cùng với các công nghệ web khác và những tính năng chính của nó trông như thế nào ở mức độ tổng quan. Trong bài này, chúng ta sẽ đi vào những điều cơ bản thực sự, xem xét cách làm việc với những khối xây dựng cơ bản nhất của JavaScript — Biến.

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
          <li>Biến là gì và tại sao chúng quan trọng như vậy.</li>
          <li>Khai báo biến với <code>let</code>, khởi tạo chúng với giá trị và gán lại với giá trị mới.</li>
          <li>Tạo hằng số với <code>const</code>.</li>
          <li>Sự khác biệt giữa biến và hằng số, và khi nào bạn sử dụng từng cái.</li>
          <li>Các thực hành tốt nhất về đặt tên biến.</li>
          <li>Các kiểu giá trị khác nhau có thể được lưu trữ trong biến — chuỗi, số, boolean, mảng và đối tượng.</li>
        </ul>
      </td>
    </tr>
  </tbody>
</table>

## Công cụ bạn cần

Trong suốt bài này, bạn sẽ được yêu cầu gõ các dòng mã để kiểm tra sự hiểu biết của bạn về nội dung. Nếu bạn đang sử dụng trình duyệt desktop, nơi tốt nhất để gõ mã mẫu của bạn là bảng điều khiển (console) JavaScript của trình duyệt (xem [Các công cụ dành cho nhà phát triển trình duyệt là gì](/en-US/docs/Learn_web_development/Howto/Tools_and_setup/What_are_browser_developer_tools) để biết thêm thông tin về cách truy cập công cụ này).

## Biến là gì?

Một biến là một vùng chứa cho một giá trị, giống như một số chúng ta có thể sử dụng trong một phép tính, hoặc một chuỗi mà chúng ta có thể sử dụng như một phần của câu.

### Ví dụ về biến

Hãy xem một ví dụ:

```html
<button id="button_A">Press me</button>
<h3 id="heading_A"></h3>
```

```js
const buttonA = document.querySelector("#button_A");
const headingA = document.querySelector("#heading_A");

let count = 1;

buttonA.onclick = () => {
  buttonA.textContent = "Try again!";
  headingA.textContent = `${count} clicks so far`;
  count += 1;
};
```

{{ EmbedLiveSample('Variable_example', '100%', 120) }}

Trong ví dụ này, việc nhấn nút chạy một số mã. Đầu tiên, nó thay đổi văn bản trên chính nút. Thứ hai, nó hiển thị thông báo về số lần nút đã được nhấn. Số đó được lưu trữ trong một biến. Mỗi khi người dùng nhấn nút, số trong biến sẽ tăng thêm một.

### Không có biến

Để hiểu tại sao điều này hữu ích như vậy, hãy suy nghĩ về cách chúng ta sẽ viết ví dụ này mà không sử dụng biến để lưu trữ số đếm. Nó sẽ kết thúc trông giống như thế này:

```html example-bad
<button id="button_B">Press me</button>
<h3 id="heading_B"></h3>
```

```js example-bad
const buttonB = document.querySelector("#button_B");
const headingB = document.querySelector("#heading_B");

buttonB.onclick = () => {
  buttonB.textContent = "Try again!";
  headingB.textContent = "1 click so far";
};
```

{{ EmbedLiveSample('Without_a_variable', '100%', 120) }}

Bạn có thể chưa hiểu đầy đủ cú pháp chúng ta đang sử dụng (chưa!), nhưng bạn có thể hiểu ý tưởng. Không có biến, chúng ta không có cách nào biết nút đã được nhấp bao nhiêu lần. Thông báo cho người dùng sẽ nhanh chóng trở nên không liên quan khi không có thông tin nào có thể được ghi nhớ.

Biến chỉ có ý nghĩa, và khi bạn học nhiều hơn về JavaScript chúng sẽ bắt đầu trở thành bản năng thứ hai.

Một điều đặc biệt về biến là chúng có thể chứa hầu hết mọi thứ — không chỉ là chuỗi và số. Biến cũng có thể chứa dữ liệu phức tạp và thậm chí toàn bộ hàm để làm những điều tuyệt vời. Bạn sẽ tìm hiểu thêm về điều này khi tiến lên.

> [!NOTE]
> Chúng ta nói biến _chứa_ các giá trị. Đây là một sự phân biệt quan trọng cần thực hiện. Biến không phải là giá trị bản thân; chúng là vùng chứa cho các giá trị. Bạn có thể nghĩ chúng như những hộp các tông nhỏ mà bạn có thể cất đồ vào.

![Ảnh chụp màn hình của ba hộp các tông 3 chiều minh họa các ví dụ về biến JavaScript. Mỗi hộp chứa các giá trị giả định đại diện cho các kiểu dữ liệu JavaScript khác nhau. Các giá trị mẫu lần lượt là "Bob", true và 35.](boxes.png)

## Khai báo một biến

Để sử dụng một biến, đầu tiên bạn phải tạo nó — chính xác hơn, chúng ta gọi đây là khai báo biến. Để làm điều này, chúng ta gõ từ khóa `let` theo sau là tên bạn muốn đặt cho biến của mình:

```js
let myName;
let myAge;
```

Ở đây chúng ta đang tạo hai biến gọi là `myName` và `myAge`. Hãy thử gõ những dòng này vào bảng điều khiển (console) trình duyệt web của bạn. Sau đó, hãy thử tạo một biến (hoặc hai) với tên do bạn chọn.

> [!NOTE]
> Trong JavaScript, tất cả các câu lệnh mã nên kết thúc bằng dấu chấm phẩy (`;`) — mã của bạn có thể hoạt động đúng cho các dòng đơn, nhưng có lẽ sẽ không khi bạn đang viết nhiều dòng mã cùng nhau. Hãy cố gắng tạo thói quen bao gồm nó.

Bạn có thể kiểm tra xem các giá trị này bây giờ có tồn tại trong môi trường thực thi hay không bằng cách gõ chỉ tên biến, ví dụ:

```js
myName;
myAge;
```

Chúng hiện không có giá trị; chúng là các vùng chứa rỗng. Khi bạn nhập tên biến, bạn sẽ nhận được giá trị `undefined` được trả về. Nếu chúng không tồn tại, bạn sẽ nhận được thông báo lỗi — hãy thử gõ

```js
scoobyDoo;
```

> [!NOTE]
> Đừng nhầm lẫn một biến tồn tại nhưng không có giá trị được định nghĩa với một biến không tồn tại chút nào — chúng là những thứ rất khác nhau. Trong phép ẩn dụ hộp bạn đã thấy ở trên, không tồn tại có nghĩa là không có hộp (biến) nào để giá trị đặt vào. Không có giá trị được định nghĩa có nghĩa là có một hộp, nhưng nó không có giá trị bên trong nó.

## Khởi tạo một biến

Khi bạn đã khai báo một biến, bạn có thể khởi tạo nó với một giá trị. Bạn thực hiện điều này bằng cách gõ tên biến, theo sau là dấu bằng (`=`), theo sau là giá trị bạn muốn đặt cho nó. Ví dụ:

```js
myName = "Chris";
myAge = 37;
```

Hãy thử quay lại bảng điều khiển (console) ngay bây giờ và gõ những dòng này. Bạn sẽ thấy giá trị bạn đã gán cho biến được trả về trong bảng điều khiển (console) để xác nhận nó, trong mỗi trường hợp. Một lần nữa, bạn có thể trả về giá trị biến của mình bằng cách gõ tên của chúng vào bảng điều khiển (console) — hãy thử lại chúng:

```js
myName;
myAge;
```

Bạn có thể khai báo và khởi tạo một biến cùng một lúc, như thế này:

```js
let myDog = "Rover";
```

Đây có lẽ là những gì bạn sẽ làm hầu hết thời gian, vì nó nhanh hơn so với thực hiện hai hành động trên hai dòng riêng biệt.

## Ghi chú về var

Bạn có thể cũng thấy một cách khác để khai báo biến, sử dụng từ khóa `var`:

```js
var myName;
var myAge;
```

Khi JavaScript được tạo ra lần đầu, đây là cách duy nhất để khai báo biến. Thiết kế của `var` gây nhầm lẫn và dễ bị lỗi. Vì vậy, `let` đã được tạo ra trong các phiên bản JavaScript hiện đại, một từ khóa mới để tạo biến hoạt động hơi khác so với `var`, khắc phục các vấn đề của nó trong quá trình đó.

Một vài sự khác biệt đơn giản được giải thích bên dưới. Chúng ta sẽ không đi vào tất cả các sự khác biệt bây giờ, nhưng bạn sẽ bắt đầu khám phá chúng khi bạn tìm hiểu thêm về JavaScript (nếu bạn thực sự muốn đọc về chúng ngay bây giờ, hãy xem [trang tham khảo let](/en-US/docs/Web/JavaScript/Reference/Statements/let) của chúng ta).

Đầu tiên, nếu bạn viết một chương trình JavaScript nhiều dòng khai báo và khởi tạo một biến, bạn thực sự có thể khai báo một biến với `var` sau khi bạn khởi tạo nó và nó vẫn sẽ hoạt động. Ví dụ:

```js
myName = "Chris";

function logName() {
  console.log(myName);
}

logName();

var myName;
```

> [!NOTE]
> Điều này sẽ không hoạt động khi gõ các dòng riêng lẻ vào bảng điều khiển (console) JavaScript, chỉ khi chạy nhiều dòng JavaScript trong tài liệu web.

Điều này hoạt động là do **hoisting** — đọc [var hoisting](/en-US/docs/Web/JavaScript/Reference/Statements/var#hoisting) để biết thêm chi tiết về chủ đề này.

Hoisting không còn hoạt động với `let`. Nếu chúng ta thay đổi `var` thành `let` trong ví dụ trên, nó sẽ thất bại với một lỗi. Đây là điều tốt — khai báo một biến sau khi bạn khởi tạo nó dẫn đến mã khó hiểu, khó hiểu hơn.

Thứ hai, khi bạn sử dụng `var`, bạn có thể khai báo cùng một biến bao nhiêu lần tùy thích, nhưng với `let` bạn không thể. Đoạn sau sẽ hoạt động:

```js
var myName = "Chris";
var myName = "Bob";
```

Nhưng đoạn sau sẽ gây ra lỗi ở dòng thứ hai:

```js example-bad
let myName = "Chris";
let myName = "Bob";
```

Bạn sẽ phải làm điều này thay thế:

```js
let myName = "Chris";
myName = "Bob";
```

Một lần nữa, đây là một quyết định ngôn ngữ hợp lý. Không có lý do để khai báo lại biến — nó chỉ làm mọi thứ khó hiểu hơn.

Vì những lý do này và nhiều lý do khác, chúng ta khuyến nghị bạn sử dụng `let` trong mã của mình, thay vì `var`. Trừ khi bạn đang viết rõ ràng hỗ trợ cho các trình duyệt cổ, không còn lý do gì để sử dụng `var` vì tất cả các trình duyệt hiện đại đều hỗ trợ `let` từ năm 2015.

> [!NOTE]
> Nếu bạn đang thử mã này trong bảng điều khiển (console) của trình duyệt, hãy sao chép & dán từng khối mã ở đây dưới dạng toàn bộ. Có một [tính năng trong bảng điều khiển (console) Chrome](https://docs.google.com/document/d/1NP_FnHr4WCZRp7exgUklvNiXrH3nujcfwvp2pzMQ8-0/edit#heading=h.7y5hynxk52e9) trong đó việc khai báo lại biến với `let` và `const` được phép:
>
> ```plain
> > let myName = "Chris";
>   let myName = "Bob";
> // As one input: SyntaxError: Identifier 'myName' has already been declared
>
> > let myName = "Chris";
> > let myName = "Bob";
> // As two inputs: both succeed
> ```

## Cập nhật một biến

Khi một biến đã được khởi tạo với một giá trị, bạn có thể thay đổi (hoặc cập nhật) giá trị đó bằng cách đặt cho nó một giá trị khác. Hãy thử nhập các dòng sau vào bảng điều khiển (console) của bạn:

```js
myName = "Bob";
myAge = 40;
```

### Lưu ý về quy tắc đặt tên biến

Bạn có thể đặt tên biến khá nhiều theo bất cứ thứ gì bạn muốn, nhưng có những hạn chế. Nói chung, bạn nên chỉ sử dụng các ký tự Latin (0-9, a-z, A-Z) và ký tự gạch dưới.

- Bạn không nên sử dụng các ký tự khác vì chúng có thể gây ra lỗi hoặc khó hiểu đối với khán giả quốc tế.
- Đừng sử dụng gạch dưới ở đầu tên biến — điều này được sử dụng trong một số cấu trúc JavaScript nhất định để có nghĩa là những điều cụ thể, vì vậy có thể gây nhầm lẫn.
- Đừng sử dụng số ở đầu biến. Điều này không được phép và gây ra lỗi.
- Quy ước an toàn để tuân thủ là {{Glossary("camel_case", "lower camel case")}}, trong đó bạn ghép nhiều từ lại với nhau, sử dụng chữ thường cho toàn bộ từ đầu tiên và sau đó viết hoa các từ tiếp theo. Chúng ta đã sử dụng cách này cho tên biến của mình trong bài cho đến nay.
- Đặt tên biến sao cho trực quan, để chúng mô tả dữ liệu chứa bên trong. Đừng chỉ sử dụng một chữ cái/số đơn, hoặc các cụm từ dài.
- Biến phân biệt chữ hoa chữ thường — vì vậy `myage` là một biến khác với `myAge`.
- Một điểm cuối cùng: bạn cũng cần tránh sử dụng các từ dành riêng của JavaScript làm tên biến — bằng điều này, chúng ta có ý là các từ tạo thành cú pháp thực tế của JavaScript! Vì vậy, bạn không thể sử dụng các từ như `var`, `function`, `let` và `for` làm tên biến. Trình duyệt nhận ra chúng là các mục mã khác nhau, và vì vậy bạn sẽ gặp lỗi.

> [!NOTE]
> Bạn có thể tìm một danh sách khá đầy đủ các từ khóa dành riêng cần tránh tại [Lexical grammar — keywords](/en-US/docs/Web/JavaScript/Reference/Lexical_grammar#keywords).

Ví dụ tên tốt:

```plain example-good
age
myAge
init
initialColor
finalOutputValue
audio1
audio2
```

Ví dụ tên xấu:

```plain example-bad
1
a
_12
myage
MYAGE
var
Document
skjfndskjfnbdskjfb
thisisareallylongvariablenameman
```

Hãy thử tạo thêm một vài biến bây giờ, với hướng dẫn ở trên.

## Kiểu biến

Có một vài kiểu dữ liệu khác nhau mà chúng ta có thể lưu trữ trong biến. Trong phần này, chúng ta sẽ mô tả những điều này ngắn gọn, sau đó trong các bài tiếp theo, bạn sẽ tìm hiểu chi tiết hơn về chúng.

### Số

Bạn có thể lưu trữ số trong biến, có thể là số nguyên như 30 (còn gọi là số nguyên) hoặc số thập phân như 2.456 (còn gọi là số thực hoặc số dấu phẩy động). Bạn không cần khai báo kiểu biến trong JavaScript, không giống như một số ngôn ngữ lập trình khác. Khi bạn đặt cho biến một giá trị số, bạn không bao gồm dấu nháy:

```js
let myAge = 17;
```

### Chuỗi

Chuỗi là các đoạn văn bản. Khi bạn đặt cho biến một giá trị chuỗi, bạn cần bọc nó trong dấu nháy đơn hoặc dấu nháy kép; nếu không, JavaScript cố gắng hiểu nó như một tên biến khác.

```js
let dolphinGoodbye = "So long and thanks for all the fish";
```

### Boolean

Boolean là các giá trị đúng/sai — chúng có thể có hai giá trị, `true` hoặc `false`. Chúng thường được sử dụng để kiểm tra một điều kiện, sau đó mã được chạy thích hợp. Vì vậy, ví dụ, một trường hợp đơn giản sẽ là:

```js
let iAmAlive = true;
```

Trong khi trên thực tế nó sẽ được sử dụng nhiều hơn như thế này:

```js
let test = 6 < 3;
```

Điều này đang sử dụng toán tử "nhỏ hơn" (`<`) để kiểm tra xem 6 có nhỏ hơn 3 không. Như bạn có thể mong đợi, nó trả về `false`, vì 6 không nhỏ hơn 3! Bạn sẽ tìm hiểu nhiều hơn về các toán tử như vậy sau này trong khóa học.

### Mảng

Một mảng là một đối tượng đơn chứa nhiều giá trị được đặt trong dấu ngoặc vuông và được phân tách bằng dấu phẩy. Hãy thử nhập các dòng sau vào bảng điều khiển (console) của bạn:

```js
let myNameArray = ["Chris", "Bob", "Jim"];
let myNumberArray = [10, 15, 40];
```

Khi các mảng này được xác định, bạn có thể truy cập từng giá trị theo vị trí của chúng trong mảng. Hãy thử những dòng này:

```js
myNameArray[0]; // should return 'Chris'
myNumberArray[2]; // should return 40
```

Dấu ngoặc vuông chỉ định một giá trị chỉ số tương ứng với vị trí của giá trị bạn muốn trả về. Bạn có thể nhận thấy rằng mảng trong JavaScript được đánh số bắt đầu từ không: phần tử đầu tiên ở chỉ số 0.

### Đối tượng

Trong lập trình, một đối tượng là một cấu trúc mã mô phỏng một đối tượng trong cuộc sống thực. Bạn có thể có một đối tượng đại diện cho một hộp và chứa thông tin về chiều rộng, chiều dài và chiều cao của nó, hoặc bạn có thể có một đối tượng đại diện cho một người và chứa dữ liệu về tên, chiều cao, cân nặng, ngôn ngữ họ nói, cách chào họ và nhiều hơn nữa.

Hãy thử nhập dòng sau vào bảng điều khiển (console) của bạn:

```js
let dog = { name: "Spot", breed: "Dalmatian" };
```

Để truy xuất thông tin được lưu trữ trong đối tượng, bạn có thể sử dụng cú pháp sau:

```js
dog.name;
```

## Kiểu dữ liệu động

JavaScript là một "ngôn ngữ được đánh kiểu động", có nghĩa là, không giống như một số ngôn ngữ khác, bạn không cần chỉ định kiểu dữ liệu mà biến sẽ chứa (số, chuỗi, mảng, v.v.).

Ví dụ, nếu bạn khai báo một biến và đặt cho nó một giá trị được đặt trong dấu nháy, trình duyệt coi biến đó như một chuỗi:

```js
let myString = "Hello";
```

Ngay cả khi giá trị được đặt trong dấu nháy chỉ là các chữ số, nó vẫn là chuỗi — không phải số — vì vậy hãy cẩn thận:

```js
let myNumber = "500"; // oops, this is still a string
typeof myNumber;
myNumber = 500; // much better — now this is a number
typeof myNumber;
```

Hãy thử nhập bốn dòng trên vào bảng điều khiển (console) của bạn từng dòng một và xem kết quả là gì. Bạn sẽ nhận thấy rằng chúng ta đang sử dụng một toán tử đặc biệt gọi là [`typeof`](/en-US/docs/Web/JavaScript/Reference/Operators/typeof) — nó trả về kiểu dữ liệu của biến bạn gõ sau nó. Lần đầu tiên nó được gọi, nó sẽ trả về `string`, vì tại thời điểm đó biến `myNumber` chứa một chuỗi, `'500'`. Hãy nhìn và xem nó trả về gì lần thứ hai khi bạn gọi nó.

## Hằng số trong JavaScript

Cũng như biến, bạn có thể khai báo hằng số. Chúng giống như biến, ngoại trừ:

- bạn phải khởi tạo chúng khi khai báo chúng.
- bạn không thể gán cho chúng một giá trị mới sau khi bạn đã khởi tạo chúng.

Ví dụ, sử dụng `let` bạn có thể khai báo một biến mà không khởi tạo nó:

```js
let count;
```

Nếu bạn thử làm điều này sử dụng `const` bạn sẽ thấy một lỗi:

```js example-bad
const count;
```

Tương tự, với `let` bạn có thể khởi tạo một biến, và sau đó gán cho nó một giá trị mới (điều này cũng được gọi là _gán lại_ biến):

```js
let count = 1;
count = 2;
```

Nếu bạn thử làm điều này sử dụng `const` bạn sẽ thấy một lỗi:

```js example-bad
const count = 1;
count = 2;
```

Lưu ý rằng mặc dù hằng số trong JavaScript phải luôn đặt tên cho cùng một giá trị, bạn có thể thay đổi nội dung của giá trị mà nó đặt tên. Đây không phải là sự phân biệt hữu ích cho các kiểu đơn giản như số hoặc boolean, nhưng hãy xem xét một đối tượng:

```js
const bird = { species: "Kestrel" };
console.log(bird.species); // "Kestrel"
```

Bạn có thể cập nhật, thêm hoặc xóa các thuộc tính của đối tượng được khai báo bằng `const`, vì mặc dù nội dung của đối tượng đã thay đổi, hằng số vẫn trỏ đến cùng một đối tượng:

```js
bird.species = "Striated Caracara";
console.log(bird.species); // "Striated Caracara"
```

## Khi nào sử dụng const và khi nào sử dụng let

Nếu bạn không thể làm được nhiều thứ với `const` như bạn có thể với `let`, tại sao bạn lại thích sử dụng nó hơn `let`? Thực tế `const` rất hữu ích. Nếu bạn sử dụng `const` để đặt tên một giá trị, nó cho bất kỳ ai nhìn vào mã của bạn biết rằng tên này sẽ không bao giờ được gán cho một giá trị khác. Bất cứ lúc nào họ thấy tên này, họ sẽ biết nó đề cập đến điều gì.

Trong khóa học này, chúng ta áp dụng nguyên tắc sau về khi nào sử dụng `let` và khi nào sử dụng `const`:

_Sử dụng `const` khi bạn có thể, và sử dụng `let` khi bạn phải._

Điều này có nghĩa là nếu bạn có thể khởi tạo một biến khi bạn khai báo nó, và không cần gán lại nó sau này, hãy làm cho nó là hằng số.

## Tóm tắt

Đến bây giờ bạn nên biết một lượng hợp lý về biến JavaScript và cách tạo chúng. Trong bài tiếp theo, chúng ta sẽ cung cấp cho bạn một số bài kiểm tra mà bạn có thể sử dụng để kiểm tra mức độ hiểu biết và ghi nhớ thông tin này của bạn.

{{PreviousMenuNext("Learn_web_development/Core/Scripting/What_went_wrong", "Learn_web_development/Core/Scripting/Test_your_skills/Variables", "Learn_web_development/Core/Scripting")}}
