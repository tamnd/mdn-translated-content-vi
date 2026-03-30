---
title: Giá trị trả về của hàm
slug: Learn_web_development/Core/Scripting/Return_values
page-type: learn-module-chapter
sidebar: learnsidebar
---

{{PreviousMenuNext("Learn_web_development/Core/Scripting/Build_your_own_function","Learn_web_development/Core/Scripting/Test_your_skills/Functions", "Learn_web_development/Core/Scripting")}}

Có một khái niệm thiết yếu cuối cùng về hàm mà chúng ta cần thảo luận — giá trị trả về. Một số hàm không trả về giá trị có ý nghĩa, nhưng những hàm khác thì có. Điều quan trọng là phải hiểu các giá trị của chúng là gì, cách sử dụng chúng trong mã của bạn, và cách làm cho hàm trả về các giá trị hữu ích. Chúng ta sẽ đề cập tất cả những điều này bên dưới.

<table>
  <tbody>
    <tr>
      <th scope="row">Điều kiện tiên quyết:</th>
      <td>Hiểu biết về <a href="/en-US/docs/Learn_web_development/Core/Structuring_content">HTML</a> và <a href="/en-US/docs/Learn_web_development/Core/Styling_basics">nền tảng CSS</a>, quen thuộc với kiến thức cơ bản về hàm JavaScript như đã học trong bài trước.</td>
    </tr>
    <tr>
      <th scope="row">Kết quả học tập:</th>
      <td>
        <ul>
          <li>Giá trị trả về là gì.</li>
          <li>Cách sử dụng giá trị trả về của các hàm hiện có.</li>
          <li>Thêm giá trị trả về vào hàm của riêng bạn.</li>
        </ul>
      </td>
    </tr>
  </tbody>
</table>

## Giá trị trả về là gì?

**Giá trị trả về** chính là những gì chúng nghe giống — các giá trị mà một hàm trả về khi nó hoàn thành. Bạn đã gặp giá trị trả về nhiều lần rồi, mặc dù bạn có thể chưa nghĩ về chúng một cách rõ ràng.

Hãy quay lại một ví dụ quen thuộc (từ [bài viết trước](/en-US/docs/Learn_web_development/Core/Scripting/Functions#built-in_browser_functions) trong loạt bài này):

```js
const myText = "The weather is cold";
const newString = myText.replace("cold", "warm");
console.log(newString); // Should print "The weather is warm"
// the replace() string function takes a string,
// replaces one substring with another, and returns
// a new string with the replacement made
```

Hàm [`replace()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/replace) được gọi trên chuỗi `myText`, và được truyền hai tham số:

- Chuỗi con cần tìm (`"cold"`).
- Chuỗi để thay thế nó (`"warm"`).

Khi hàm hoàn thành (chạy xong), nó trả về một giá trị, là một chuỗi mới với sự thay thế đã được thực hiện. Trong mã trên, kết quả của giá trị trả về này được lưu trong biến `newString`.

Nếu bạn nhìn vào trang tham chiếu MDN của hàm [`replace()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/replace), bạn sẽ thấy một phần gọi là [giá trị trả về](/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/replace#return_value). Rất hữu ích khi biết và hiểu các giá trị nào được trả về bởi hàm, vì vậy chúng ta cố gắng bao gồm thông tin này ở bất cứ đâu có thể.

Một số hàm không trả về bất kỳ giá trị nào. (Trong những trường hợp như vậy, các trang tham chiếu của chúng ta liệt kê giá trị trả về là [`void`](/en-US/docs/Web/JavaScript/Reference/Operators/void) hoặc [`undefined`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/undefined).) Ví dụ, trong hàm [`displayMessage()`](https://github.com/mdn/learning-area/blob/main/javascript/building-blocks/functions/function-stage-4.html#L50) mà chúng ta đã xây dựng trong bài trước, không có giá trị cụ thể nào được trả về khi hàm được gọi. Nó chỉ làm cho một hộp xuất hiện đâu đó trên màn hình — thế thôi!

Nhìn chung, giá trị trả về được sử dụng ở nơi hàm là một bước trung gian trong tính toán nào đó. Bạn muốn đến kết quả cuối cùng, bao gồm một số giá trị cần được tính toán bởi một hàm. Sau khi hàm tính toán giá trị, nó có thể trả về kết quả để có thể lưu trong một biến; và bạn có thể sử dụng biến này trong giai đoạn tiếp theo của phép tính.

## Cách trả về giá trị

Để trả về một giá trị từ một hàm tùy chỉnh, bạn cần sử dụng từ khóa [`return`](/en-US/docs/Web/JavaScript/Reference/Statements/return). Chúng ta đã thấy điều này trong ví dụ [random-canvas-circles.html](https://github.com/mdn/learning-area/blob/main/javascript/building-blocks/loops/random-canvas-circles.html) gần đây. Hàm `draw()` vẽ 100 vòng tròn ngẫu nhiên ở đâu đó trên HTML {{htmlelement("canvas")}}:

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

Bên trong mỗi lần lặp vòng lặp, ba lời gọi được thực hiện đến hàm `random()`, để tạo ra một giá trị ngẫu nhiên cho _tọa độ x_, _tọa độ y_, và _bán kính_ của vòng tròn hiện tại. Hàm `random()` nhận một tham số — một số nguyên — và trả về một số nguyên ngẫu nhiên giữa `0` và số đó. Nó trông như thế này:

```js
function random(number) {
  return Math.floor(Math.random() * number);
}
```

Điều này có thể được viết như sau:

```js
function random(number) {
  const result = Math.floor(Math.random() * number);
  return result;
}
```

Nhưng phiên bản đầu tiên nhanh hơn để viết và nhỏ gọn hơn.

Chúng ta đang trả về kết quả của phép tính `Math.floor(Math.random() * number)` mỗi khi hàm được gọi. Giá trị trả về này xuất hiện tại điểm hàm được gọi, và mã tiếp tục.

Vì vậy khi bạn thực thi:

```js
ctx.arc(random(WIDTH), random(HEIGHT), random(50), 0, 2 * Math.PI);
```

Nếu ba lần gọi `random()` trả về các giá trị `500`, `200`, và `35`, dòng thực sự sẽ chạy như thể nó là:

```js
ctx.arc(500, 200, 35, 0, 2 * Math.PI);
```

Các lời gọi hàm trên dòng được chạy trước, và giá trị trả về của chúng được thay thế cho các lời gọi hàm, trước khi bản thân dòng sau đó được thực thi.

## Triển khai giá trị trả về hàm

Hãy thử viết một số hàm có giá trị trả về.

1. Tạo một bản sao local của tệp [function-library.html](https://github.com/mdn/learning-area/blob/main/javascript/building-blocks/functions/function-library.html) từ GitHub. Đây là một trang HTML đơn giản chứa trường nhập văn bản {{htmlelement("input")}} và một đoạn văn. Cũng có phần tử {{htmlelement("script")}}, trong đó chúng ta đã lưu trữ tham chiếu đến cả hai phần tử HTML trong hai biến. Trang này sẽ cho phép bạn nhập một số vào ô nhập văn bản và hiển thị các số liên quan khác nhau bên dưới.

2. Thêm một số hàm hữu ích vào phần tử `<script>` này bên dưới hai dòng hiện có:

   ```js
   function squared(num) {
     return num * num;
   }

   function cubed(num) {
     return num * num * num;
   }

   function factorial(num) {
     if (num < 0) return undefined;
     if (num === 0) return 1;
     let x = num - 1;
     while (x > 1) {
       num *= x;
       x--;
     }
     return num;
   }
   ```

   Các hàm `squared()` và `cubed()` khá rõ ràng — chúng trả về bình phương hoặc lập phương của số được đưa ra làm tham số. Hàm `factorial()` trả về [giai thừa](https://en.wikipedia.org/wiki/Factorial) của số đã cho.

3. Thêm cách in thông tin về số được nhập vào ô nhập văn bản bằng cách thêm trình xử lý sự kiện sau bên dưới các hàm hiện có:

   ```js
   input.addEventListener("change", () => {
     const num = parseFloat(input.value);
     if (isNaN(num)) {
       para.textContent = "You need to enter a number!";
     } else {
       para.textContent = `${num} squared is ${squared(num)}. `;
       para.textContent += `${num} cubed is ${cubed(num)}. `;
       para.textContent += `${num} factorial is ${factorial(num)}. `;
     }
   });
   ```

4. Lưu mã của bạn, tải nó trong trình duyệt, và thử.

Đây là một số giải thích cho hàm `addEventListener()` trong bước 3 ở trên:

- Bằng cách thêm trình nghe sự kiện `change`, hàm này chạy bất cứ khi nào sự kiện `change` kích hoạt trên ô nhập văn bản — tức là khi một giá trị mới được nhập vào `input` văn bản và được gửi (nhập giá trị, sau đó bỏ focus ô nhập bằng cách nhấn <kbd>Tab</kbd> hoặc <kbd>Return</kbd>). Khi hàm vô danh này chạy, giá trị trong `input` được lưu trong hằng số `num`.
- Câu lệnh `if` in thông báo lỗi nếu giá trị được nhập không phải là số. Điều kiện kiểm tra xem biểu thức `isNaN(num)` có trả về `true` không. Hàm [`isNaN()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/isNaN) kiểm tra xem giá trị `num` có không phải là số không — nếu vậy, nó trả về `true`, và nếu không, nó trả về `false`.
- Nếu điều kiện trả về `false`, giá trị `num` là một số và hàm in ra một câu bên trong phần tử đoạn văn nêu giá trị bình phương, lập phương và giai thừa của số. Câu gọi các hàm `squared()`, `cubed()`, và `factorial()` để tính toán các giá trị cần thiết.

> [!NOTE]
> Nếu bạn gặp khó khăn khi làm cho ví dụ hoạt động, hãy kiểm tra mã của bạn so với [phiên bản hoàn thành trên GitHub](https://github.com/mdn/learning-area/blob/main/javascript/building-blocks/functions/function-library-finished.html) ([xem nó chạy trực tiếp](https://mdn.github.io/learning-area/javascript/building-blocks/functions/function-library-finished.html) cũng).

### Thêm một số hàm của riêng bạn!

Tại thời điểm này, chúng ta muốn bạn thử viết ra một vài hàm của riêng bạn và thêm chúng vào thư viện. Căn bậc hai hoặc căn bậc ba của số? Hoặc chu vi của một hình tròn với bán kính đã cho?

Một số mẹo liên quan đến hàm:

- Hãy xem một ví dụ khác về viết _xử lý lỗi_ vào hàm. Nhìn chung, đó là ý tưởng tốt để kiểm tra rằng bất kỳ tham số cần thiết nào được xác thực, và rằng bất kỳ tham số tùy chọn nào có một số loại giá trị mặc định được cung cấp. Bằng cách này, chương trình của bạn sẽ ít có khả năng ném lỗi hơn.
- Hãy nghĩ về ý tưởng tạo _thư viện hàm_. Khi bạn tiến xa hơn trong sự nghiệp lập trình, bạn sẽ bắt đầu làm các loại thứ giống nhau lại và lại. Đó là ý tưởng tốt để tạo thư viện các hàm tiện ích của riêng bạn để làm những thứ như vậy. Bạn có thể sao chép chúng sang mã mới, hoặc thậm chí chỉ áp dụng chúng vào các trang HTML bất cứ khi nào bạn cần.

## Tóm tắt

Vậy là chúng ta đã đến đây — hàm rất thú vị, rất hữu ích, và mặc dù có rất nhiều điều để nói về cú pháp và chức năng của chúng, chúng khá dễ hiểu.

Trong bài tiếp theo, chúng ta sẽ cung cấp cho bạn một số bài kiểm tra mà bạn có thể sử dụng để kiểm tra mức độ bạn đã hiểu và ghi nhớ tất cả thông tin chúng ta đã cung cấp cho bạn về hàm trong vài bài viết vừa qua.

## Xem thêm

- [Hàm chuyên sâu](/en-US/docs/Web/JavaScript/Reference/Functions) — một hướng dẫn chi tiết bao gồm thông tin liên quan đến hàm nâng cao hơn.
- [Hàm callback trong JavaScript](https://www.impressivewebs.com/callback-functions-javascript/) — một mẫu JavaScript phổ biến là truyền một hàm vào một hàm khác _như một đối số_. Sau đó nó được gọi bên trong hàm đầu tiên. Điều này nằm ngoài phạm vi của khóa học này, nhưng đáng để nghiên cứu trước khi lâu.

{{PreviousMenuNext("Learn_web_development/Core/Scripting/Build_your_own_function","Learn_web_development/Core/Scripting/Test_your_skills/Functions", "Learn_web_development/Core/Scripting")}}
