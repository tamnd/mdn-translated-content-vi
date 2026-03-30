---
title: Mảng
slug: Learn_web_development/Core/Scripting/Arrays
page-type: learn-module-chapter
sidebar: learnsidebar
---

{{PreviousMenuNext("Learn_web_development/Core/Scripting/Test_your_skills/Strings", "Learn_web_development/Core/Scripting/Test_your_skills/Arrays", "Learn_web_development/Core/Scripting")}}

Trong bài học này, chúng ta sẽ xem xét mảng — một cách gọn gàng để lưu trữ danh sách các mục dữ liệu dưới một tên biến duy nhất. Ở đây, chúng ta xem xét lý do tại sao điều này hữu ích, sau đó khám phá cách tạo [mảng](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array), truy xuất, thêm và xóa các mục được lưu trữ trong mảng, và nhiều hơn nữa.

<table>
  <tbody>
    <tr>
      <th scope="row">Điều kiện tiên quyết:</th>
      <td>Hiểu biết về <a href="/en-US/docs/Learn_web_development/Core/Structuring_content">HTML</a> và <a href="/en-US/docs/Learn_web_development/Core/Styling_basics">các nguyên tắc cơ bản của CSS</a>. Quen thuộc với các kiểu dữ liệu cơ bản như số và chuỗi, như đã đề cập trong các bài học trước.</td>
    </tr>
    <tr>
      <th scope="row">Kết quả học tập:</th>
      <td>
        <ul>
          <li>Mảng là gì — một cấu trúc giữ danh sách các biến.</li>
          <li>Cú pháp của mảng — <code>[a, b, c]</code> và cú pháp truy cập, <code>myArray[x]</code>.</li>
          <li>Sửa đổi giá trị mảng với <code>myArray[x] = y</code>.</li>
          <li>Thao tác mảng bằng các thuộc tính và phương thức phổ biến như <code>length</code>, <code>push()</code>, <code>pop()</code>, <code>join()</code> và <code>split()</code>.</li>
          <li>Các phương thức mảng nâng cao như <code>forEach()</code>, <code>map()</code> và <code>filter()</code>.</li>
        </ul>
      </td>
    </tr>
  </tbody>
</table>

## Mảng là gì?

Mảng thường được mô tả là "các đối tượng giống danh sách"; về cơ bản, chúng là các đối tượng đơn chứa nhiều giá trị được lưu trữ trong một danh sách. Các đối tượng mảng có thể được lưu trữ trong các biến và xử lý theo cách gần như giống với bất kỳ loại giá trị nào khác, sự khác biệt là chúng ta có thể truy cập từng giá trị bên trong danh sách riêng lẻ và làm những điều siêu hữu ích và hiệu quả với danh sách, như lặp qua nó và làm cùng một thứ với mọi giá trị. Có thể chúng ta có một loạt các mục sản phẩm và giá của chúng được lưu trữ trong một mảng, và chúng ta muốn lặp qua tất cả chúng và in chúng trên hóa đơn, đồng thời cộng tất cả giá lại với nhau và in ra tổng giá ở cuối.

Nếu chúng ta không có mảng, chúng ta sẽ phải lưu trữ mọi mục trong một biến riêng biệt, sau đó gọi mã thực hiện việc in và thêm riêng biệt cho mỗi mục. Điều này sẽ lâu hơn nhiều để viết ra, kém hiệu quả hơn và dễ mắc lỗi hơn. Nếu chúng ta có 10 mục cần thêm vào hóa đơn thì đã khó chịu rồi, nhưng nếu là 100 mục, hoặc 1000 mục thì sao? Chúng ta sẽ trở lại ví dụ này sau trong bài.

Như trong các bài trước, hãy tìm hiểu về những điều cơ bản thực sự của mảng bằng cách nhập một số ví dụ vào [bảng điều khiển (console) nhà phát triển trình duyệt](/en-US/docs/Learn_web_development/Howto/Tools_and_setup/What_are_browser_developer_tools).

> [!NOTE]
> Scrimba's [Aside: Intro to arrays](https://scrimba.com/the-frontend-developer-career-path-c0j/~06e?via=mdn) scrim <sup>[_MDN learning partner_](/en-US/docs/MDN/Writing_guidelines/Learning_content#partner_links_and_embeds)</sup> cung cấp phần giới thiệu tương tác hữu ích về mảng với các ví dụ và thử thách để kiểm tra kiến thức của bạn.

## Tạo mảng

Mảng bao gồm dấu ngoặc vuông và các mục được phân tách bằng dấu phẩy.

1. Giả sử chúng ta muốn lưu trữ một danh sách mua sắm trong một mảng. Dán mã sau vào bảng điều khiển (console):

   ```js
   const shopping = ["bread", "milk", "cheese", "hummus", "noodles"];
   console.log(shopping);
   ```

2. Trong ví dụ trên, mỗi mục là một chuỗi, nhưng trong mảng, chúng ta có thể lưu trữ nhiều kiểu dữ liệu khác nhau — chuỗi, số, đối tượng và thậm chí các mảng khác. Chúng ta cũng có thể trộn các kiểu dữ liệu trong một mảng — chúng ta không phải giới hạn bản thân chỉ lưu số trong một mảng, và trong mảng khác chỉ lưu chuỗi. Ví dụ:

   ```js
   const sequence = [1, 1, 2, 3, 5, 8, 13];
   const random = ["tree", 795, [0, 1, 2]];
   ```

3. Trước khi tiếp tục, hãy tạo một vài mảng ví dụ.

## Tìm độ dài của mảng

Bạn có thể tìm ra độ dài của mảng (có bao nhiêu mục trong đó) theo đúng cách giống như bạn tìm ra độ dài (tính bằng ký tự) của chuỗi — bằng cách sử dụng thuộc tính {{jsxref("Array.prototype.length","length")}}. Hãy thử đoạn sau:

```js
const shopping = ["bread", "milk", "cheese", "hummus", "noodles"];
console.log(shopping.length); // 5
```

## Truy cập và sửa đổi các mục mảng

Mảng là [bộ sưu tập được lập chỉ số](/en-US/docs/Web/JavaScript/Guide/Indexed_collections). Các mục trong mảng được đánh số, bắt đầu từ không. Con số này được gọi là _chỉ số_ của mục. Vì vậy, mục đầu tiên có chỉ số 0, mục thứ hai có chỉ số 1, v.v. Bạn có thể truy cập các mục riêng lẻ trong mảng bằng ký hiệu dấu ngoặc và cung cấp chỉ số của mục, theo cách tương tự như bạn [truy cập các chữ cái trong chuỗi](/en-US/docs/Learn_web_development/Core/Scripting/Useful_string_methods#retrieving_a_specific_string_character).

1. Nhập vào bảng điều khiển (console) của bạn:

   ```js
   const shopping = ["bread", "milk", "cheese", "hummus", "noodles"];
   console.log(shopping[0]);
   // returns "bread"
   ```

2. Bạn cũng có thể sửa đổi một mục trong mảng bằng cách đặt cho một mục mảng đơn một giá trị mới. Hãy thử điều này:

   ```js
   const shopping = ["bread", "milk", "cheese", "hummus", "noodles"];
   shopping[0] = "tahini";
   console.log(shopping);
   // shopping will now return [ "tahini", "milk", "cheese", "hummus", "noodles" ]
   ```

   > [!NOTE]
   > Chúng ta đã nói điều này trước đó, nhưng chỉ nhắc nhở — JavaScript bắt đầu lập chỉ số mảng từ không!

3. Lưu ý rằng mảng bên trong mảng được gọi là mảng đa chiều. Bạn có thể truy cập một mục bên trong mảng là chính nó bên trong mảng khác bằng cách kết hợp hai bộ dấu ngoặc vuông lại với nhau. Ví dụ, để truy cập một trong các mục bên trong mảng là mục thứ ba bên trong mảng `random` (xem phần trước), chúng ta có thể làm điều gì đó như thế này:

   ```js
   const random = ["tree", 795, [0, 1, 2]];
   random[2][2];
   ```

4. Hãy thử thực hiện một số sửa đổi nữa cho các ví dụ mảng của bạn trước khi tiếp tục. Chơi một chút, và xem những gì hoạt động và những gì không.

## Tìm chỉ số của các mục trong mảng

Nếu bạn không biết chỉ số của một mục, bạn có thể sử dụng phương thức {{jsxref("Array.prototype.indexOf()","indexOf()")}}.
Phương thức `indexOf()` lấy một mục làm đối số và sẽ trả về chỉ số của mục hoặc `-1` nếu mục không có trong mảng:

```js
const birds = ["Parrot", "Falcon", "Owl"];
console.log(birds.indexOf("Owl")); //  2
console.log(birds.indexOf("Rabbit")); // -1
```

## Thêm các mục

Để thêm một hoặc nhiều mục vào cuối mảng, chúng ta có thể sử dụng {{jsxref("Array.prototype.push()","push()")}}. Lưu ý rằng bạn cần bao gồm một hoặc nhiều mục mà bạn muốn thêm vào cuối mảng.

```js
const cities = ["Manchester", "Liverpool"];
cities.push("Cardiff");
console.log(cities); // [ "Manchester", "Liverpool", "Cardiff" ]
cities.push("Bradford", "Brighton");
console.log(cities); // [ "Manchester", "Liverpool", "Cardiff", "Bradford", "Brighton" ]
```

Độ dài mới của mảng được trả về khi lời gọi phương thức hoàn thành. Nếu bạn muốn lưu trữ độ dài mảng mới trong một biến, bạn có thể làm điều gì đó như thế này:

```js
const cities = ["Manchester", "Liverpool"];
const newLength = cities.push("Bristol");
console.log(cities); // [ "Manchester", "Liverpool", "Bristol" ]
console.log(newLength); // 3
```

Để thêm một mục vào đầu mảng, hãy sử dụng {{jsxref("Array.prototype.unshift()","unshift()")}}:

```js
const cities = ["Manchester", "Liverpool"];
cities.unshift("Edinburgh");
console.log(cities); // [ "Edinburgh", "Manchester", "Liverpool" ]
```

## Xóa các mục

Để xóa mục cuối cùng khỏi mảng, hãy sử dụng {{jsxref("Array.prototype.pop()","pop()")}}.

```js
const cities = ["Manchester", "Liverpool"];
cities.pop();
console.log(cities); // [ "Manchester" ]
```

Phương thức `pop()` trả về mục đã được xóa. Để lưu mục đó trong một biến mới, bạn có thể làm điều này:

```js
const cities = ["Manchester", "Liverpool"];
const removedCity = cities.pop();
console.log(removedCity); // "Liverpool"
```

Để xóa mục đầu tiên khỏi mảng, hãy sử dụng {{jsxref("Array.prototype.shift()","shift()")}}:

```js
const cities = ["Manchester", "Liverpool"];
cities.shift();
console.log(cities); // [ "Liverpool" ]
```

Nếu bạn biết chỉ số của một mục, bạn có thể xóa nó khỏi mảng bằng {{jsxref("Array.prototype.splice()","splice()")}}:

```js
const cities = ["Manchester", "Liverpool", "Edinburgh", "Carlisle"];
const index = cities.indexOf("Liverpool");
if (index !== -1) {
  cities.splice(index, 1);
}
console.log(cities); // [ "Manchester", "Edinburgh", "Carlisle" ]
```

Trong lời gọi `splice()` này, đối số đầu tiên nói bắt đầu xóa mục từ đâu, và đối số thứ hai nói bao nhiêu mục nên được xóa. Vì vậy, bạn có thể xóa nhiều hơn một mục:

```js
const cities = ["Manchester", "Liverpool", "Edinburgh", "Carlisle"];
const index = cities.indexOf("Liverpool");
if (index !== -1) {
  cities.splice(index, 2);
}
console.log(cities); // [ "Manchester", "Carlisle" ]
```

## Truy cập mọi mục

Rất thường xuyên bạn sẽ muốn truy cập mọi mục trong mảng. Bạn có thể làm điều này bằng cách sử dụng câu lệnh {{jsxref("statements/for...of","for...of")}}:

```js
const birds = ["Parrot", "Falcon", "Owl"];

for (const bird of birds) {
  console.log(bird);
}
```

Đôi khi bạn sẽ muốn làm cùng một thứ với mỗi mục trong mảng, để lại cho bạn một mảng chứa các mục đã được thay đổi. Bạn có thể làm điều này bằng {{jsxref("Array.prototype.map()","map()")}}. Mã dưới đây lấy một mảng các số và nhân đôi mỗi số:

```js
function double(number) {
  return number * 2;
}
const numbers = [5, 2, 7, 6];
const doubled = numbers.map(double);
console.log(doubled); // [ 10, 4, 14, 12 ]
```

Chúng ta đưa một hàm vào `map()`, và `map()` gọi hàm một lần cho mỗi mục trong mảng, truyền mục vào. Sau đó nó thêm giá trị trả về từ mỗi lời gọi hàm vào một mảng mới, và cuối cùng trả về mảng mới.

Đôi khi bạn sẽ muốn tạo một mảng mới chỉ chứa các mục trong mảng gốc khớp với một số bài kiểm tra. Bạn có thể làm điều đó bằng {{jsxref("Array.prototype.filter()","filter()")}}. Mã dưới đây lấy một mảng chuỗi và trả về một mảng chỉ chứa các chuỗi dài hơn 8 ký tự:

```js
function isLong(city) {
  return city.length > 8;
}
const cities = ["London", "Liverpool", "Totnes", "Edinburgh"];
const longer = cities.filter(isLong);
console.log(longer); // [ "Liverpool", "Edinburgh" ]
```

Giống như `map()`, chúng ta đưa một hàm vào phương thức `filter()`, và `filter()` gọi hàm này cho mọi mục trong mảng, truyền mục vào. Nếu hàm trả về `true`, thì mục được thêm vào một mảng mới. Cuối cùng nó trả về mảng mới.

## Chuyển đổi giữa chuỗi và mảng

Thường bạn sẽ được trình bày với một số dữ liệu thô chứa trong một chuỗi dài, và bạn có thể muốn tách các mục hữu ích ra thành một dạng hữu ích hơn và sau đó làm những điều với chúng, như hiển thị chúng trong bảng dữ liệu. Để làm điều này, chúng ta có thể sử dụng phương thức {{jsxref("String.prototype.split()","split()")}}. Trong dạng đơn giản nhất, nó lấy một tham số duy nhất, ký tự bạn muốn tách chuỗi tại đó, và trả về các chuỗi con giữa dấu phân cách như các mục trong mảng.

> [!NOTE]
> Được rồi, đây về mặt kỹ thuật là phương thức chuỗi, không phải phương thức mảng, nhưng chúng ta đã đặt nó với mảng vì nó phù hợp ở đây.

1. Hãy chơi với điều này để xem cách hoạt động. Trước tiên, hãy tạo một chuỗi trong bảng điều khiển (console) của bạn:

   ```js
   const data = "Manchester,London,Liverpool,Birmingham,Leeds,Carlisle";
   ```

2. Bây giờ hãy tách nó tại mỗi dấu phẩy:

   ```js
   const cities = data.split(",");
   cities;
   ```

3. Cuối cùng, hãy thử tìm độ dài của mảng mới và truy xuất một số mục từ nó:

   ```js
   cities.length;
   cities[0]; // the first item in the array
   cities[1]; // the second item in the array
   cities[cities.length - 1]; // the last item in the array
   ```

4. Bạn cũng có thể đi theo chiều ngược lại bằng phương thức {{jsxref("Array.prototype.join()","join()")}}. Hãy thử đoạn sau:

   ```js
   const commaSeparated = cities.join(",");
   commaSeparated;
   ```

5. Một cách khác để chuyển đổi mảng thành chuỗi là sử dụng phương thức {{jsxref("Array.prototype.toString()","toString()")}}. `toString()` có thể đơn giản hơn `join()` vì nó không lấy tham số, nhưng hạn chế hơn. Với `join()` bạn có thể chỉ định các dấu phân cách khác nhau, trong khi `toString()` luôn sử dụng dấu phẩy. (Hãy thử chạy Bước 4 với một ký tự khác dấu phẩy.)

   ```js
   const dogNames = ["Rocket", "Flash", "Bella", "Slugger"];
   dogNames.toString(); // Rocket,Flash,Bella,Slugger
   ```

## In những sản phẩm đó

Đến lượt bạn. Trong bài tập này, bạn sẽ trở lại ví dụ chúng ta đã mô tả trước đó — in tên và giá sản phẩm trên hóa đơn, sau đó cộng tổng giá và in chúng ở cuối. Làm theo các bước dưới đây để triển khai logic.

1. Nhấp **"Play"** trong khối mã bên dưới để chỉnh sửa ví dụ trong MDN Playground.
2. Bên dưới nhận xét `// Part 1` là một số chuỗi, mỗi chuỗi chứa tên sản phẩm và giá được phân tách bằng dấu hai chấm. Chúng ta muốn bạn bỏ ghi chú những chuỗi này và biến chúng thành mảng có tên `products`.
3. Bên dưới nhận xét `// Part 2`, hãy bắt đầu vòng lặp `for...of()` để đi qua mọi mục trong mảng `products`.
4. Bên dưới nhận xét `// Part 3`, chúng ta muốn bạn viết một dòng mã tách mục mảng hiện tại (`name:price`) thành hai mục riêng biệt, một chứa tên và một chứa giá. Nếu bạn không chắc cách làm điều này, hãy xem bài [Phương thức chuỗi hữu ích](/en-US/docs/Learn_web_development/Core/Scripting/Useful_string_methods) để được giúp đỡ, hoặc tốt hơn, hãy xem phần [Chuyển đổi giữa chuỗi và mảng](#converting_between_strings_and_arrays) của bài này.
5. Là một phần của dòng mã trên, bạn cũng sẽ muốn chuyển đổi giá từ chuỗi thành số. Nếu bạn không thể nhớ cách làm điều này, hãy xem [bài chuỗi đầu tiên](/en-US/docs/Learn_web_development/Core/Scripting/Strings#numbers_vs._strings).
6. Có một biến gọi là `total` được tạo ra và được đặt giá trị là `0` ở đầu mã. Bên trong vòng lặp (bên dưới `// Part 4`), chúng ta muốn bạn thêm một dòng cộng giá mục hiện tại vào tổng đó trong mỗi lần lặp của vòng lặp, để ở cuối mã tổng đúng được in trên hóa đơn. Bạn có thể cần [toán tử gán](/en-US/docs/Learn_web_development/Core/Scripting/Math#assignment_operators) để làm điều này.
7. Chúng ta muốn bạn thay đổi dòng tiếp theo sau `// Part 5` để biến `itemText` được đặt bằng "tên mục hiện tại — $giá mục hiện tại", ví dụ "Shoes — $23.99" trong mỗi trường hợp, để thông tin đúng cho mỗi mục được in trên hóa đơn. Đây là nối chuỗi cơ bản, mà bạn đã quen thuộc nếu bạn đã làm theo tài liệu học cho đến nay.
8. Cuối cùng, bên dưới nhận xét `// Part 6`, bạn cần thêm một `}` để đánh dấu kết thúc của vòng lặp `for...of()`.

Nếu bạn mắc lỗi, bạn có thể xóa công việc của mình bằng nút _Reset_ trong MDN Playground. Nếu bạn thực sự bị kẹt, bạn có thể xem giải pháp bên dưới đầu ra trực tiếp.

```html hidden live-sample___arrays-1
<h2>Live output</h2>

<div class="output">
  <ul></ul>

  <p></p>
</div>
```

```css hidden live-sample___arrays-1
.output {
  min-height: 100px;
}
```

```js live-sample___arrays-1
const list = document.querySelector(".output ul");
const totalBox = document.querySelector(".output p");
let total = 0;
list.textContent = "";
totalBox.textContent = "";
// Part 1
// "Underpants:6.99",
// "Socks:5.99",
// "T-shirt:14.99",
// "Trousers:31.99",
// "Shoes:23.99",

// Part 2

// Part 3

// Part 4

// Part 5
let itemText = 0;

const listItem = document.createElement("li");
listItem.textContent = itemText;
list.appendChild(listItem);

// Part 6

totalBox.textContent = `Total: $${total.toFixed(2)}`;
```

{{ EmbedLiveSample("arrays-1", "100%", 200) }}

<details>
<summary>Nhấp vào đây để xem giải pháp</summary>

JavaScript hoàn thành của bạn sẽ trông như thế này:

```js
const list = document.querySelector(".output ul");
const totalBox = document.querySelector(".output p");
let total = 0;
list.textContent = "";
totalBox.textContent = "";

const products = [
  "Underpants:6.99",
  "Socks:5.99",
  "T-shirt:14.99",
  "Trousers:31.99",
  "Shoes:23.99",
];

for (const product of products) {
  const subArray = product.split(":");
  const name = subArray[0];
  const price = Number(subArray[1]);
  total += price;
  const itemText = `${name} — $${price}`;

  const listItem = document.createElement("li");
  listItem.textContent = itemText;
  list.appendChild(listItem);
}

totalBox.textContent = `Total: $${total.toFixed(2)}`;
```

</details>

## Lưu trữ 5 tìm kiếm gần đây

Hãy để bạn hoàn thành một bài tập khác, để tiếp tục luyện tập.

Một cách sử dụng tốt cho các phương thức mảng như {{jsxref("Array.prototype.push()","push()")}} và {{jsxref("Array.prototype.pop()","pop()")}} là khi bạn đang duy trì hồ sơ các mục hiện đang hoạt động trong một ứng dụng web. Trong cảnh hoạt hình chẳng hạn, bạn có thể có một mảng các đối tượng đại diện cho đồ họa nền hiện đang được hiển thị, và bạn có thể chỉ muốn 50 được hiển thị cùng một lúc, vì lý do hiệu suất hoặc lộn xộn. Khi các đối tượng mới được tạo và thêm vào mảng, các đối tượng cũ hơn có thể bị xóa khỏi mảng để duy trì số lượng mong muốn.

Trong ví dụ này, chúng ta sẽ hiển thị một cách sử dụng đơn giản hơn nhiều — ở đây chúng ta đang cung cấp cho bạn một trang web tìm kiếm giả, với hộp tìm kiếm. Ý tưởng là khi các thuật ngữ được nhập vào hộp tìm kiếm, 5 thuật ngữ tìm kiếm trước đó hàng đầu được hiển thị trong danh sách. Khi số thuật ngữ vượt quá 5, thuật ngữ cuối cùng bắt đầu bị xóa mỗi khi thuật ngữ mới được thêm vào đầu, vì vậy 5 thuật ngữ trước đó luôn được hiển thị.

> [!NOTE]
> Trong ứng dụng tìm kiếm thực, bạn có thể nhấp vào các thuật ngữ tìm kiếm trước đó để quay lại các tìm kiếm trước đó, và nó sẽ hiển thị kết quả tìm kiếm thực tế! Chúng ta chỉ đang giữ nó đơn giản cho bây giờ.

Để hoàn thành ví dụ, chúng ta cần bạn:

1. Nhấp **"Play"** trong khối mã bên dưới để chỉnh sửa ví dụ trong MDN Playground.
2. Thêm một dòng bên dưới nhận xét `// Part 1` để thêm giá trị hiện tại được nhập vào ô nhập tìm kiếm vào đầu mảng. Điều này có thể được lấy bằng cách sử dụng `searchInput.value`.
3. Thêm một dòng bên dưới nhận xét `// Part 2` để xóa giá trị hiện tại ở cuối mảng.

Nếu bạn mắc lỗi, bạn có thể xóa công việc của mình bằng nút _Reset_ trong MDN Playground. Nếu bạn thực sự bị kẹt, bạn có thể xem giải pháp bên dưới đầu ra trực tiếp.

```html hidden live-sample___arrays-2
<div class="output">
  <label for="search-box">Enter a search term: </label>
  <input id="search-box" type="search" />
  <button>Search</button>

  <ul></ul>
</div>
```

```css hidden live-sample___arrays-2
.output {
  margin: 1rem;
}
```

```js live-sample___arrays-2
const list = document.querySelector(".output ul");
const searchInput = document.querySelector(".output input");
const searchBtn = document.querySelector(".output button");

list.textContent = "";

const myHistory = [];
const MAX_HISTORY = 5;

searchBtn.addEventListener("click", () => {
  // we will only allow a term to be entered if the search input isn't empty
  if (searchInput.value !== "") {
    // Part 1

    // empty the list so that we don't display duplicate entries
    // the display is regenerated every time a search term is entered.
    list.textContent = "";

    // loop through the array, and display all the search terms in the list
    for (const itemText of myHistory) {
      const listItem = document.createElement("li");
      listItem.textContent = itemText;
      list.appendChild(listItem);
    }

    // If the array length is 5 or more, remove the oldest search term
    if (myHistory.length >= MAX_HISTORY) {
      // Part 2
    }

    // empty the search input and focus it, ready for the next term to be entered
    searchInput.value = "";
    searchInput.focus();
  }
});
```

{{ EmbedLiveSample("arrays-2", "100%", 200) }}

<details>
<summary>Nhấp vào đây để xem giải pháp</summary>

JavaScript hoàn thành của bạn sẽ trông như thế này:

```js
const list = document.querySelector(".output ul");
const searchInput = document.querySelector(".output input");
const searchBtn = document.querySelector(".output button");

list.textContent = "";

const myHistory = [];
const MAX_HISTORY = 5;

searchBtn.addEventListener("click", () => {
  // we will only allow a term to be entered if the search input isn't empty
  if (searchInput.value !== "") {
    myHistory.unshift(searchInput.value);

    // empty the list so that we don't display duplicate entries
    // the display is regenerated every time a search term is entered.
    list.textContent = "";

    // loop through the array, and display all the search terms in the list
    for (const itemText of myHistory) {
      const listItem = document.createElement("li");
      listItem.textContent = itemText;
      list.appendChild(listItem);
    }

    // If the array length is 5 or more, remove the oldest search term
    if (myHistory.length >= MAX_HISTORY) {
      myHistory.pop();
    }

    // empty the search input and focus it, ready for the next term to be entered
    searchInput.value = "";
    searchInput.focus();
  }
});
```

</details>

## Tóm tắt

Sau khi đọc qua bài này, chúng ta chắc chắn rằng bạn sẽ đồng ý rằng mảng có vẻ khá hữu ích; bạn sẽ thấy chúng xuất hiện khắp nơi trong JavaScript, thường liên quan đến vòng lặp để làm cùng một thứ với mọi mục trong mảng. Chúng ta sẽ dạy bạn tất cả về vòng lặp sau trong mô-đun.

Trong bài tiếp theo, chúng ta sẽ cung cấp cho bạn một số bài kiểm tra mà bạn có thể sử dụng để kiểm tra mức độ hiểu biết và ghi nhớ thông tin chúng ta đã cung cấp về mảng.

## Xem thêm

- {{jsxref("Array")}}
  - : Trang tham khảo đối tượng `Array` cung cấp hướng dẫn tham khảo chi tiết về các tính năng được thảo luận trong trang này, và nhiều tính năng `Array` khác.

{{PreviousMenuNext("Learn_web_development/Core/Scripting/Test_your_skills/Strings", "Learn_web_development/Core/Scripting/Test_your_skills/Arrays", "Learn_web_development/Core/Scripting")}}
