---
title: Đưa ra quyết định trong mã — câu lệnh điều kiện
short-title: Conditionals
slug: Learn_web_development/Core/Scripting/Conditionals
page-type: learn-module-chapter
sidebar: learnsidebar
---

{{PreviousMenuNext("Learn_web_development/Core/Scripting/Silly_story_generator", "Learn_web_development/Core/Scripting/Test_your_skills/Conditionals", "Learn_web_development/Core/Scripting")}}

Trong bất kỳ ngôn ngữ lập trình nào, mã cũng cần đưa ra quyết định và thực hiện các hành động tương ứng tùy thuộc vào các đầu vào khác nhau. Ví dụ, trong một trò chơi, nếu số lượng mạng sống của người chơi là 0, thì trò chơi kết thúc. Trong ứng dụng thời tiết, nếu đang xem vào buổi sáng, hiển thị hình ảnh bình minh; hiển thị ngôi sao và mặt trăng nếu là ban đêm. Trong bài viết này, chúng ta sẽ khám phá cách các câu lệnh điều kiện hoạt động trong JavaScript.

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
          <li>Hiểu câu lệnh điều kiện là gì — một cấu trúc mã để chạy các đường dẫn mã khác nhau tùy thuộc vào kết quả kiểm tra.</li>
          <li>Triển khai điều kiện bằng <code>if</code>/<code>else</code>/<code>else if</code>.</li>
          <li>Sử dụng toán tử so sánh để tạo kiểm tra.</li>
          <li>Triển khai logic AND, OR và NOT trong kiểm tra.</li>
          <li>Câu lệnh switch.</li>
          <li>Toán tử ba ngôi.</li>
        </ul>
      </td>
    </tr>
  </tbody>
</table>

## Bạn có thể có nó với một điều kiện!

Con người (và các động vật khác) luôn đưa ra các quyết định ảnh hưởng đến cuộc sống của họ, từ nhỏ ("tôi có nên ăn một hay hai chiếc bánh quy?") đến lớn ("tôi có nên ở lại quê hương và làm nông trại của gia đình, hay nên chuyển đến Mỹ để học thiên văn vật lý?")

Các câu lệnh điều kiện cho phép chúng ta biểu diễn quá trình đưa ra quyết định như vậy trong JavaScript, từ sự lựa chọn phải được thực hiện (ví dụ, "một bánh quy hay hai"), đến kết quả của những lựa chọn đó (có lẽ kết quả của "ăn một bánh quy" có thể là "vẫn cảm thấy đói", và kết quả của "ăn hai bánh quy" có thể là "cảm thấy no, nhưng mẹ đã mắng vì ăn hết bánh quy".)

![Một nhân vật hoạt hình giống người cầm một chiếc lọ bánh quy có nhãn 'Cookies'. Có một dấu hỏi phía trên đầu nhân vật. Có hai bong bóng hội thoại. Bong bóng bên trái có một chiếc bánh quy. Bong bóng bên phải có hai chiếc bánh quy. Kết hợp lại, điều này gợi ý rằng nhân vật đang cố gắng quyết định xem có nên ăn một hay hai chiếc bánh quy.](cookie-choice-small.png)

## Câu lệnh if...else

Hãy xem xét loại câu lệnh điều kiện phổ biến nhất bạn sẽ sử dụng trong JavaScript — câu lệnh [`if...else`](/en-US/docs/Web/JavaScript/Reference/Statements/if...else) quen thuộc.

### Cú pháp cơ bản của if...else

Cú pháp cơ bản của `if...else` trông như thế này:

```js
if (condition) {
  /* code to run if condition is true */
} else {
  /* run some other code instead */
}
```

Ở đây chúng ta có:

1. Từ khóa `if` theo sau là một cặp dấu ngoặc đơn.
2. Một điều kiện cần kiểm tra, được đặt trong dấu ngoặc đơn (thường là "giá trị này có lớn hơn giá trị kia không?", hoặc "giá trị này có tồn tại không?"). Điều kiện sử dụng [toán tử so sánh](/en-US/docs/Learn_web_development/Core/Scripting/Math#comparison_operators) mà chúng ta đã thảo luận trước đó trong module và trả về `true` hoặc `false`.
3. Một cặp dấu ngoặc nhọn, bên trong có một số mã — đây có thể là bất kỳ mã nào chúng ta muốn, và nó chỉ chạy nếu điều kiện trả về `true`.
4. Từ khóa `else`.
5. Một cặp dấu ngoặc nhọn khác, bên trong có thêm một số mã — đây có thể là bất kỳ mã nào chúng ta muốn, và nó chỉ chạy nếu điều kiện không phải `true` — hay nói cách khác, điều kiện là `false`.

Mã này khá dễ đọc — nó nói rằng "**nếu** **điều kiện** trả về `true`, chạy mã A, **ngược lại** chạy mã B"

Bạn cần lưu ý rằng bạn không nhất thiết phải bao gồm `else` và khối dấu ngoặc nhọn thứ hai — đoạn mã sau cũng hoàn toàn hợp lệ:

```js
if (condition) {
  /* code to run if condition is true */
}

/* run some other code */
```

Tuy nhiên, bạn cần cẩn thận ở đây — trong trường hợp này, khối mã thứ hai không được kiểm soát bởi câu lệnh điều kiện, vì vậy nó **luôn** chạy, bất kể điều kiện trả về `true` hay `false`. Điều này không nhất thiết là xấu, nhưng có thể không phải điều bạn muốn — thường thì bạn muốn chạy một khối mã _hoặc_ khối kia, không phải cả hai.

Cuối cùng, trong khi không được khuyến nghị, đôi khi bạn có thể thấy các câu lệnh `if...else` được viết không có dấu ngoặc nhọn:

```js example-bad
if (condition) doSomething();
else doSomethingElse();
```

Cú pháp này hoàn toàn hợp lệ, nhưng sẽ dễ hiểu hơn nhiều nếu bạn sử dụng dấu ngoặc nhọn để phân định các khối mã, và sử dụng nhiều dòng và thụt đầu dòng.

### Một ví dụ thực tế

Để hiểu cú pháp này tốt hơn, hãy xem xét một ví dụ thực tế. Hãy tưởng tượng một đứa trẻ được bố hoặc mẹ nhờ giúp đỡ một công việc nhà. Cha mẹ có thể nói "Này con yêu! Nếu con giúp bố/mẹ đi mua sắm, bố/mẹ sẽ cho con thêm tiền tiêu vặt để con có đủ tiền mua món đồ chơi mà con muốn." Trong JavaScript, chúng ta có thể biểu diễn điều này như sau:

```js
let shoppingDone = false;
let childAllowance;

if (shoppingDone === true) {
  childAllowance = 10;
} else {
  childAllowance = 5;
}
```

Mã này như được hiển thị luôn dẫn đến biến `shoppingDone` trả về `false`, có nghĩa là sự thất vọng cho đứa trẻ tội nghiệp của chúng ta. Tùy thuộc vào chúng ta để cung cấp một cơ chế cho cha mẹ đặt biến `shoppingDone` thành `true` nếu đứa trẻ đã đi mua sắm.

> [!NOTE]
> Bạn có thể xem [phiên bản đầy đủ hơn của ví dụ này trên GitHub](https://github.com/mdn/learning-area/blob/main/javascript/building-blocks/allowance-updater.html) (cũng xem nó [chạy trực tiếp](https://mdn.github.io/learning-area/javascript/building-blocks/allowance-updater.html).)

### else if

Ví dụ cuối cung cấp cho chúng ta hai lựa chọn, hoặc kết quả — nhưng nếu chúng ta muốn nhiều hơn hai thì sao?

Có một cách để nối thêm các lựa chọn/kết quả vào `if...else` của bạn — sử dụng `else if`. Mỗi lựa chọn bổ sung yêu cầu thêm một khối để đặt giữa `if () { }` và `else { }` — hãy xem ví dụ phức tạp hơn sau đây, có thể là một phần của ứng dụng dự báo thời tiết đơn giản:

```html
<label for="weather">Select the weather type today: </label>
<select id="weather">
  <option value="">--Make a choice--</option>
  <option value="sunny">Sunny</option>
  <option value="rainy">Rainy</option>
  <option value="snowing">Snowing</option>
  <option value="overcast">Overcast</option>
</select>

<p></p>
```

```js
const select = document.querySelector("select");
const para = document.querySelector("p");

select.addEventListener("change", setWeather);

function setWeather() {
  const choice = select.value;

  if (choice === "sunny") {
    para.textContent =
      "It is nice and sunny outside today. Wear shorts! Go to the beach, or the park, and get an ice cream.";
  } else if (choice === "rainy") {
    para.textContent =
      "Rain is falling outside; take a rain coat and an umbrella, and don't stay out for too long.";
  } else if (choice === "snowing") {
    para.textContent =
      "The snow is coming down — it is freezing! Best to stay in with a cup of hot chocolate, or go build a snowman.";
  } else if (choice === "overcast") {
    para.textContent =
      "It isn't raining, but the sky is grey and gloomy; it could turn any minute, so take a rain coat just in case.";
  } else {
    para.textContent = "";
  }
}
```

{{ EmbedLiveSample('else_if', '100%', 100, "", "") }}

1. Ở đây chúng ta có một phần tử HTML {{htmlelement("select")}} cho phép chúng ta đưa ra các lựa chọn thời tiết khác nhau, và một đoạn văn đơn giản.
2. Trong JavaScript, chúng ta lưu trữ tham chiếu đến cả phần tử {{htmlelement("select")}} và {{htmlelement("p")}}, và thêm trình nghe sự kiện vào phần tử `<select>` sao cho khi giá trị của nó thay đổi, hàm `setWeather()` được chạy.
3. Khi hàm này chạy, trước tiên chúng ta đặt biến `choice` thành giá trị hiện tại được chọn trong phần tử `<select>`. Sau đó chúng ta sử dụng câu lệnh điều kiện để hiển thị các văn bản khác nhau bên trong đoạn văn tùy thuộc vào giá trị của `choice`. Lưu ý cách tất cả các điều kiện được kiểm tra trong các khối `else if () { }`, ngoại trừ điều kiện đầu tiên, được kiểm tra trong khối `if () { }`.
4. Lựa chọn cuối cùng, bên trong khối `else { }`, về cơ bản là một tùy chọn "phương án cuối cùng" — mã bên trong sẽ được chạy nếu không có điều kiện nào là `true`. Trong trường hợp này, nó phục vụ để làm trống văn bản khỏi đoạn văn nếu không có gì được chọn, ví dụ, nếu người dùng quyết định chọn lại tùy chọn giữ chỗ "--Make a choice--" được hiển thị ở đầu.

> [!NOTE]
> Bạn cũng có thể [tìm ví dụ này trên GitHub](https://github.com/mdn/learning-area/blob/main/javascript/building-blocks/simple-else-if.html) ([xem nó chạy trực tiếp](https://mdn.github.io/learning-area/javascript/building-blocks/simple-else-if.html) tại đó.)

### Lưu ý về toán tử so sánh

Toán tử so sánh được sử dụng để kiểm tra các điều kiện bên trong câu lệnh điều kiện của chúng ta. Chúng ta đã xem xét toán tử so sánh trước đây trong bài viết [Toán học cơ bản trong JavaScript — số và toán tử](/en-US/docs/Learn_web_development/Core/Scripting/Math#comparison_operators). Các lựa chọn của chúng ta là:

- `===` và `!==` — kiểm tra xem một giá trị có giống hệt hoặc không giống hệt giá trị khác hay không.
- `<` và `>` — kiểm tra xem một giá trị có nhỏ hơn hay lớn hơn giá trị khác hay không.
- `<=` và `>=` — kiểm tra xem một giá trị có nhỏ hơn hoặc bằng, hoặc lớn hơn hoặc bằng giá trị khác hay không.

Chúng ta muốn đề cập đặc biệt đến việc kiểm tra các giá trị boolean (`true`/`false`), và một mẫu phổ biến mà bạn sẽ gặp lại và lại. Bất kỳ giá trị nào không phải `false`, `undefined`, `null`, `0`, `NaN`, hoặc chuỗi rỗng (`''`) thực sự trả về `true` khi được kiểm tra như câu lệnh điều kiện, do đó bạn có thể sử dụng tên biến đơn thuần để kiểm tra xem nó có phải `true` hay không, hoặc thậm chí rằng nó tồn tại (tức là, nó không phải undefined). Ví dụ:

```js
let cheese = "Cheddar";

if (cheese) {
  console.log("Yay! Cheese available for making cheese on toast.");
} else {
  console.log("No cheese on toast for you today.");
}
```

Và, quay lại ví dụ trước về đứa trẻ làm việc nhà cho cha mẹ, bạn có thể viết nó như thế này:

```js
let shoppingDone = false;
let childAllowance;

// We don't need to explicitly specify 'shoppingDone === true'
if (shoppingDone) {
  childAllowance = 10;
} else {
  childAllowance = 5;
}
```

### Lồng nhau if...else

Hoàn toàn ổn khi đặt một câu lệnh `if...else` bên trong câu lệnh khác — để lồng chúng vào nhau. Ví dụ, chúng ta có thể cập nhật ứng dụng dự báo thời tiết của mình để hiển thị thêm một bộ lựa chọn tùy thuộc vào nhiệt độ là bao nhiêu:

```js
if (choice === "sunny") {
  if (temperature < 86) {
    para.textContent = `It is ${temperature} degrees outside — nice and sunny. Let's go out to the beach, or the park, and get an ice cream.`;
  } else if (temperature >= 86) {
    para.textContent = `It is ${temperature} degrees outside — REALLY HOT! If you want to go outside, make sure to put some sunscreen on.`;
  }
}
```

Mặc dù tất cả mã hoạt động cùng nhau, nhưng mỗi câu lệnh `if...else` hoạt động hoàn toàn độc lập với câu lệnh kia.

### Toán tử logic: AND, OR và NOT

Nếu bạn muốn kiểm tra nhiều điều kiện mà không cần viết các câu lệnh `if...else` lồng nhau, [toán tử logic](/en-US/docs/Web/JavaScript/Reference/Operators) có thể giúp bạn. Khi được sử dụng trong điều kiện, hai toán tử đầu tiên làm như sau:

- `&&` — AND; cho phép bạn nối hai hoặc nhiều biểu thức lại với nhau sao cho tất cả chúng phải đánh giá riêng lẻ là `true` để toàn bộ biểu thức trả về `true`.
- `||` — OR; cho phép bạn nối hai hoặc nhiều biểu thức lại với nhau sao cho một hoặc nhiều trong số chúng phải đánh giá riêng lẻ là `true` để toàn bộ biểu thức trả về `true`.

Để đưa ra một ví dụ AND, đoạn mã ví dụ trước có thể được viết lại thành:

```js
if (choice === "sunny" && temperature < 86) {
  para.textContent = `It is ${temperature} degrees outside — nice and sunny. Let's go out to the beach, or the park, and get an ice cream.`;
} else if (choice === "sunny" && temperature >= 86) {
  para.textContent = `It is ${temperature} degrees outside — REALLY HOT! If you want to go outside, make sure to put some sunscreen on.`;
}
```

Vì vậy, ví dụ, khối mã đầu tiên sẽ chỉ được chạy nếu `choice === 'sunny'` _và_ `temperature < 86` trả về `true`.

Hãy xem xét một ví dụ OR nhanh:

```js
if (iceCreamVanOutside || houseStatus === "on fire") {
  console.log("You should leave the house quickly.");
} else {
  console.log("Probably should just stay in then.");
}
```

Loại toán tử logic cuối cùng, NOT, được biểu thị bằng toán tử `!`, có thể được sử dụng để phủ định một biểu thức. Hãy kết hợp nó với OR trong ví dụ trên:

```js
if (!(iceCreamVanOutside || houseStatus === "on fire")) {
  console.log("Probably should just stay in then.");
} else {
  console.log("You should leave the house quickly.");
}
```

Trong đoạn mã này, nếu câu lệnh OR trả về `true`, toán tử NOT sẽ phủ định nó sao cho biểu thức tổng thể trả về `false`.

Bạn có thể kết hợp bao nhiêu câu lệnh logic với nhau tùy thích, trong bất kỳ cấu trúc nào. Ví dụ sau thực thi mã bên trong chỉ khi cả hai câu lệnh OR trả về `true`, có nghĩa là câu lệnh AND tổng thể sẽ trả về `true`:

```js
if ((x === 5 || y > 3 || z <= 10) && (loggedIn || userName === "Steve")) {
  // run the code
}
```

Một lỗi phổ biến khi sử dụng toán tử OR logic trong câu lệnh điều kiện là cố gắng nêu biến có giá trị bạn đang kiểm tra một lần, và sau đó đưa ra danh sách các giá trị mà nó có thể là để trả về `true`, được phân cách bởi các toán tử `||` (OR). Ví dụ:

```js example-bad
if (x === 5 || 7 || 10 || 20) {
  // run my code
}
```

Trong trường hợp này, điều kiện bên trong `if ()` sẽ luôn đánh giá là `true` vì 7 (hoặc bất kỳ giá trị khác khác 0) luôn đánh giá là `true`. Điều kiện này thực sự đang nói "nếu x bằng 5, hoặc 7 là true — luôn luôn như vậy". Đây không phải điều chúng ta muốn về mặt logic! Để làm điều này hoạt động, bạn phải chỉ định một bài kiểm tra đầy đủ ở mỗi bên của mỗi toán tử OR:

```js
if (x === 5 || x === 7 || x === 10 || x === 20) {
  // run my code
}
```

## Câu lệnh switch

Các câu lệnh `if...else` làm tốt công việc cho phép mã điều kiện, nhưng chúng không phải không có nhược điểm. Chúng chủ yếu tốt cho các trường hợp có vài lựa chọn, và mỗi lựa chọn yêu cầu một lượng mã hợp lý để chạy, và/hoặc các điều kiện phức tạp (ví dụ, nhiều toán tử logic). Đối với các trường hợp bạn chỉ muốn đặt biến thành một giá trị lựa chọn nhất định hoặc in ra một câu lệnh cụ thể tùy thuộc vào điều kiện, cú pháp có thể hơi cồng kềnh, đặc biệt nếu bạn có nhiều lựa chọn.

Trong trường hợp như vậy, [câu lệnh `switch`](/en-US/docs/Web/JavaScript/Reference/Statements/switch) là lựa chọn phù hợp — chúng lấy một biểu thức/giá trị duy nhất làm đầu vào, và sau đó tìm qua nhiều lựa chọn cho đến khi tìm thấy giá trị phù hợp, thực thi mã tương ứng đi kèm với nó. Đây là một số pseudocode để cho bạn ý tưởng:

```js
switch (expression) {
  case choice1:
    // run this code
    break;

  case choice2:
    // run this code instead
    break;

  // include as many cases as you like

  default:
    // actually, just run this code
    break;
}
```

Ở đây chúng ta có:

1. Từ khóa `switch`, theo sau là một cặp dấu ngoặc đơn.
2. Một biểu thức hoặc giá trị bên trong dấu ngoặc đơn.
3. Từ khóa `case`, theo sau là một lựa chọn mà biểu thức/giá trị có thể là, theo sau là dấu hai chấm.
4. Một số mã để chạy nếu lựa chọn khớp với biểu thức.
5. Câu lệnh `break`, theo sau là dấu chấm phẩy. Nếu lựa chọn trước khớp với biểu thức/giá trị, trình duyệt dừng thực thi khối mã ở đây, và chuyển sang bất kỳ mã nào xuất hiện bên dưới câu lệnh switch.
6. Nhiều case khác (đầu mục 3–5) tùy thích.
7. Từ khóa `default`, theo sau là mẫu mã giống hệt như một trong các case (đầu mục 3–5), ngoại trừ `default` không có lựa chọn sau nó, và bạn không cần câu lệnh `break` vì không có gì để chạy sau này trong khối dù sao. Đây là tùy chọn mặc định chạy nếu không có lựa chọn nào khớp.

> [!NOTE]
> Bạn không cần phải bao gồm phần `default` — bạn có thể bỏ qua nó một cách an toàn nếu không có khả năng biểu thức kết thúc bằng một giá trị không xác định. Tuy nhiên, nếu có khả năng như vậy, bạn cần bao gồm nó để xử lý các trường hợp không xác định.

### Một ví dụ về switch

Hãy xem một ví dụ thực tế — chúng ta sẽ viết lại ứng dụng dự báo thời tiết của mình để sử dụng câu lệnh switch thay thế:

```html
<label for="weather">Select the weather type today: </label>
<select id="weather">
  <option value="">--Make a choice--</option>
  <option value="sunny">Sunny</option>
  <option value="rainy">Rainy</option>
  <option value="snowing">Snowing</option>
  <option value="overcast">Overcast</option>
</select>

<p></p>
```

```js
const select = document.querySelector("select");
const para = document.querySelector("p");

select.addEventListener("change", setWeather);

function setWeather() {
  const choice = select.value;

  switch (choice) {
    case "sunny":
      para.textContent =
        "It is nice and sunny outside today. Wear shorts! Go to the beach, or the park, and get an ice cream.";
      break;
    case "rainy":
      para.textContent =
        "Rain is falling outside; take a rain coat and an umbrella, and don't stay out for too long.";
      break;
    case "snowing":
      para.textContent =
        "The snow is coming down — it is freezing! Best to stay in with a cup of hot chocolate, or go build a snowman.";
      break;
    case "overcast":
      para.textContent =
        "It isn't raining, but the sky is grey and gloomy; it could turn any minute, so take a rain coat just in case.";
      break;
    default:
      para.textContent = "";
  }
}
```

{{ EmbedLiveSample('A_switch_example', '100%', 100, "", "") }}

> [!NOTE]
> Bạn cũng có thể [tìm ví dụ này trên GitHub](https://github.com/mdn/learning-area/blob/main/javascript/building-blocks/simple-switch.html) (xem nó [chạy trực tiếp](https://mdn.github.io/learning-area/javascript/building-blocks/simple-switch.html) tại đó.)

## Toán tử ba ngôi

Có một phần cú pháp cuối cùng chúng ta muốn giới thiệu trước khi bạn thử các ví dụ. [Toán tử ba ngôi hoặc điều kiện](/en-US/docs/Web/JavaScript/Reference/Operators/Conditional_operator) là một đoạn cú pháp nhỏ kiểm tra một điều kiện và trả về một giá trị/biểu thức nếu nó là `true`, và một giá trị khác nếu là `false` — điều này có thể hữu ích trong một số tình huống, và có thể chiếm ít mã hơn nhiều so với khối `if...else` nếu bạn có hai lựa chọn được chọn qua điều kiện `true`/`false`. Pseudocode trông như thế này:

```js-nolint
condition ? run this code : run this code instead
```

Hãy xem một ví dụ:

```js
const greeting = isBirthday
  ? "Happy birthday Mrs. Smith — we hope you have a great day!"
  : "Good morning Mrs. Smith.";
```

Ở đây chúng ta có biến `isBirthday` — nếu đây là `true`, chúng ta gửi cho khách hàng của mình lời chúc sinh nhật vui vẻ; nếu không, chúng ta gửi lời chào hàng ngày tiêu chuẩn.

### Ví dụ toán tử ba ngôi

Toán tử ba ngôi không chỉ để đặt giá trị biến; bạn cũng có thể chạy các hàm, hoặc các dòng mã — bất cứ điều gì bạn muốn. Ví dụ trực tiếp sau đây hiển thị một trình chọn chủ đề đơn giản nơi kiểu dáng cho trang web được áp dụng bằng toán tử ba ngôi.

```html
<label for="theme">Select theme: </label>
<select id="theme">
  <option value="white">White</option>
  <option value="black">Black</option>
</select>

<h1>This is my website</h1>
```

```js
const select = document.querySelector("select");
const html = document.querySelector("html");
document.body.style.padding = "10px";

function update(bgColor, textColor) {
  html.style.backgroundColor = bgColor;
  html.style.color = textColor;
}

select.addEventListener("change", () =>
  select.value === "black"
    ? update("black", "white")
    : update("white", "black"),
);
```

{{ EmbedLiveSample('Ternary_operator_example', '100%', 300, "", "") }}

Ở đây chúng ta có phần tử {{htmlelement('select')}} để chọn chủ đề (đen hoặc trắng), cộng với một {{htmlelement("Heading_Elements", "h1")}} đơn giản để hiển thị tiêu đề trang web. Chúng ta cũng có hàm `update()`, nhận hai màu làm tham số (đầu vào). Màu nền của trang web được đặt thành màu được cung cấp đầu tiên, và màu văn bản của nó được đặt thành màu được cung cấp thứ hai.

Cuối cùng, chúng ta cũng có trình nghe sự kiện [onchange](/en-US/docs/Web/API/HTMLElement/change_event) để chạy một hàm chứa toán tử ba ngôi. Nó bắt đầu bằng điều kiện kiểm tra — `select.value === 'black'`. Nếu điều này trả về `true`, chúng ta chạy hàm `update()` với các tham số black và white, có nghĩa là chúng ta kết thúc với màu nền đen và màu văn bản trắng. Nếu trả về `false`, chúng ta chạy hàm `update()` với các tham số white và black, có nghĩa là màu sắc trang web bị đảo ngược.

> [!NOTE]
> Bạn cũng có thể [tìm ví dụ này trên GitHub](https://github.com/mdn/learning-area/blob/main/javascript/building-blocks/simple-ternary.html) (xem nó [chạy trực tiếp](https://mdn.github.io/learning-area/javascript/building-blocks/simple-ternary.html) tại đó.)

## Triển khai lịch cơ bản

Trong ví dụ này, bạn sẽ giúp chúng ta hoàn thành một ứng dụng lịch cơ bản. Trong mã bạn có:

- Phần tử {{htmlelement("select")}} để cho phép người dùng chọn giữa các tháng khác nhau.
- Trình xử lý sự kiện `change` để phát hiện khi giá trị được chọn trong menu `<select>` thay đổi.
- Hàm `createCalendar()` vẽ lịch và hiển thị tháng chính xác trong phần tử {{htmlelement("Heading_Elements", "h1")}}.

Để hoàn thành ví dụ:

1. Nhấn **"Play"** trong khối mã bên dưới để chỉnh sửa ví dụ trong MDN Playground.
2. Viết một câu lệnh điều kiện bên trong hàm `createCalendar()`, ngay bên dưới chú thích `// ADD CONDITIONAL HERE`. Nó phải:
   1. Tìm tháng được chọn (được lưu trong biến `choice`. Đây sẽ là giá trị của phần tử `<select>` sau khi giá trị thay đổi, ví dụ "January").
   2. Gán biến `days` bằng số ngày trong tháng được chọn. Để làm điều này, bạn sẽ phải tra cứu số ngày trong mỗi tháng trong năm. Bạn có thể bỏ qua năm nhuận cho mục đích của ví dụ này.

Gợi ý:

- Bạn được khuyên nên sử dụng OR logic để nhóm nhiều tháng lại với nhau trong một điều kiện; nhiều tháng có cùng số ngày.
- Hãy nghĩ xem số ngày nào phổ biến nhất, và sử dụng số đó làm giá trị mặc định.

Nếu bạn mắc lỗi, bạn có thể xóa công việc của mình bằng nút _Reset_ trong MDN Playground. Nếu bạn thực sự bị mắc kẹt, bạn có thể xem giải pháp bên dưới đầu ra trực tiếp.

```html hidden live-sample___conditionals-1
<label for="month">Select month: </label>
<select id="month">
  <option value="January">January</option>
  <option value="February">February</option>
  <option value="March">March</option>
  <option value="April">April</option>
  <option value="May">May</option>
  <option value="June">June</option>
  <option value="July">July</option>
  <option value="August">August</option>
  <option value="September">September</option>
  <option value="October">October</option>
  <option value="November">November</option>
  <option value="December">December</option>
</select>

<h1></h1>

<ul></ul>
```

```css hidden live-sample___conditionals-1
html {
  font-family: sans-serif;
}

h2 {
  font-size: 16px;
}

.a11y-label {
  margin: 0;
  text-align: right;
  font-size: 0.7rem;
  width: 98%;
}

body {
  margin: 10px;
  background: #f5f9fa;
}

* {
  box-sizing: border-box;
}

ul {
  padding-left: 0;
}

li {
  display: block;
  float: left;
  width: 25%;
  border: 2px solid white;
  padding: 5px;
  height: 40px;
  background-color: #4a2db6;
  color: white;
}
```

```js live-sample___conditionals-1
const select = document.querySelector("select");
const list = document.querySelector("ul");
const h1 = document.querySelector("h1");

select.addEventListener("change", () => {
  const choice = select.value;
  createCalendar(choice);
});

function createCalendar(month) {
  let days = 31;

  // ADD CONDITIONAL HERE

  list.textContent = "";
  h1.textContent = month;
  for (let i = 1; i <= days; i++) {
    const listItem = document.createElement("li");
    listItem.textContent = i;
    list.appendChild(listItem);
  }
}

select.value = "January";
createCalendar("January");
```

{{ EmbedLiveSample("conditionals-1", "100%", 550) }}

<details>
<summary>Nhấn vào đây để xem giải pháp</summary>

JavaScript hoàn chỉnh của bạn nên trông như thế này:

```js
const select = document.querySelector("select");
const list = document.querySelector("ul");
const h1 = document.querySelector("h1");

select.addEventListener("change", () => {
  const choice = select.value;
  createCalendar(choice);
});

function createCalendar(month) {
  let days = 31;

  if (month === "February") {
    days = 28;
  } else if (
    month === "April" ||
    month === "June" ||
    month === "September" ||
    month === "November"
  ) {
    days = 30;
  }

  list.textContent = "";
  h1.textContent = month;
  for (let i = 1; i <= days; i++) {
    const listItem = document.createElement("li");
    listItem.textContent = i;
    list.appendChild(listItem);
  }
}

select.value = "January";
createCalendar("January");
```

</details>

## Thêm nhiều lựa chọn màu sắc

Trong ví dụ này, bạn sẽ lấy ví dụ toán tử ba ngôi chúng ta đã thấy trước đó và chuyển đổi toán tử ba ngôi thành câu lệnh switch để cho phép chúng ta áp dụng nhiều lựa chọn hơn cho trang web. Hãy xem {{htmlelement("select")}} — lần này bạn sẽ thấy rằng nó không có hai tùy chọn chủ đề, mà là năm.

Để hoàn thành ví dụ:

1. Nhấn **"Play"** trong khối mã bên dưới để chỉnh sửa ví dụ trong MDN Playground.
2. Thêm câu lệnh switch ngay bên dưới chú thích `// ADD SWITCH STATEMENT`:
   1. Nó nên nhận biến `choice` làm biểu thức đầu vào.
   2. Đối với mỗi case, lựa chọn nên bằng một trong các giá trị `<option>` có thể được chọn, tức là `white`, `black`, `purple`, `yellow`, hoặc `psychedelic`. Lưu ý rằng giá trị tùy chọn là chữ thường, trong khi _nhãn_ tùy chọn, như được hiển thị trong đầu ra trực tiếp, được viết hoa. Bạn nên sử dụng các giá trị chữ thường trong mã của mình.
   3. Đối với mỗi case, hàm `update()` nên được chạy và được truyền hai giá trị màu, giá trị đầu tiên cho màu nền và giá trị thứ hai cho màu văn bản. Nhớ rằng các giá trị màu là chuỗi, vì vậy chúng cần được bao trong dấu ngoặc kép.

Nếu bạn mắc lỗi, bạn có thể xóa công việc của mình bằng nút _Reset_ trong MDN Playground. Nếu bạn thực sự bị mắc kẹt, bạn có thể xem giải pháp bên dưới đầu ra trực tiếp.

```html hidden live-sample___conditionals-2
<label for="theme">Select theme: </label>
<select id="theme">
  <option value="white">White</option>
  <option value="black">Black</option>
  <option value="purple">Purple</option>
  <option value="yellow">Yellow</option>
  <option value="psychedelic">Psychedelic</option>
</select>

<h1>This is my website</h1>
```

```css hidden live-sample___conditionals-2
html {
  font-family: sans-serif;
  height: 95%;
}

h2 {
  font-size: 16px;
}

.a11y-label {
  margin: 0;
  text-align: right;
  font-size: 0.7rem;
  width: 98%;
}

body {
  margin: 10px;
  height: inherit;
}
```

```js live-sample___conditionals-2
const select = document.querySelector("select");
const html = document.querySelector("html");

select.addEventListener("change", () => {
  const choice = select.value;

  // ADD SWITCH STATEMENT
});

function update(bgColor, textColor) {
  html.style.backgroundColor = bgColor;
  html.style.color = textColor;
}
```

{{ EmbedLiveSample("conditionals-2", "100%", 200) }}

<details>
<summary>Nhấn vào đây để xem giải pháp</summary>

JavaScript hoàn chỉnh của bạn nên trông như thế này:

```js
const select = document.querySelector("select");
const html = document.querySelector("html");

select.addEventListener("change", () => {
  const choice = select.value;

  switch (choice) {
    case "black":
      update("black", "white");
      break;
    case "white":
      update("white", "black");
      break;
    case "purple":
      update("purple", "white");
      break;
    case "yellow":
      update("yellow", "purple");
      break;
    case "psychedelic":
      update("lime", "purple");
      break;
  }
});

function update(bgColor, textColor) {
  html.style.backgroundColor = bgColor;
  html.style.color = textColor;
}
```

</details>

## Tóm tắt

Đó là tất cả những gì bạn thực sự cần biết về các cấu trúc điều kiện trong JavaScript ngay bây giờ! Trong bài viết tiếp theo, chúng ta sẽ cung cấp cho bạn một số bài kiểm tra mà bạn có thể sử dụng để kiểm tra mức độ bạn đã hiểu và ghi nhớ thông tin này.

## Xem thêm

- [Toán tử so sánh](/en-US/docs/Learn_web_development/Core/Scripting/Math#comparison_operators)
- [Câu lệnh điều kiện chi tiết](/en-US/docs/Web/JavaScript/Guide/Control_flow_and_error_handling#conditional_statements)
- [Tham chiếu if...else](/en-US/docs/Web/JavaScript/Reference/Statements/if...else)
- [Tham chiếu toán tử điều kiện (ba ngôi)](/en-US/docs/Web/JavaScript/Reference/Operators/Conditional_operator)

{{PreviousMenuNext("Learn_web_development/Core/Scripting/Silly_story_generator", "Learn_web_development/Core/Scripting/Test_your_skills/Conditionals", "Learn_web_development/Core/Scripting")}}
