---
title: Điều gì đã xảy ra? Gỡ lỗi JavaScript
short-title: Gỡ lỗi
slug: Learn_web_development/Core/Scripting/What_went_wrong
page-type: learn-module-chapter
sidebar: learnsidebar
---

{{PreviousMenuNext("Learn_web_development/Core/Scripting/A_first_splash", "Learn_web_development/Core/Scripting/Variables", "Learn_web_development/Core/Scripting")}}

Khi bạn xây dựng trò chơi "Đoán số" trong bài trước, bạn có thể đã thấy rằng nó không hoạt động. Đừng lo sợ — bài viết này nhằm mục đích giúp bạn thoát khỏi những vấn đề như vậy bằng cách cung cấp cho bạn một số mẹo về cách tìm và sửa lỗi trong chương trình JavaScript.

<table>
  <tbody>
    <tr>
      <th scope="row">Điều kiện tiên quyết:</th>
      <td>Hiểu biết về <a href="/en-US/docs/Learn_web_development/Core/Structuring_content">HTML</a> và <a href="/en-US/docs/Learn_web_development/Core/Styling_basics">các nguyên tắc cơ bản của CSS</a>, kinh nghiệm cơ bản với việc viết JavaScript.</td>
    </tr>
    <tr>
      <th scope="row">Kết quả học tập:</th>
      <td>
        <ul>
          <li>Hiểu các loại lỗi có thể xảy ra trong JavaScript.</li>
          <li>Sử dụng <code>console.log()</code> để gỡ lỗi.</li>
          <li>Kinh nghiệm cơ bản với việc sử dụng bảng điều khiển (console) JavaScript DevTools của trình duyệt.</li>
          <li>Quen thuộc cơ bản với các thông báo lỗi JavaScript và ý nghĩa của chúng.</li>
        </ul>
      </td>
    </tr>
  </tbody>
</table>

## Các loại lỗi

Nói chung, khi bạn làm điều gì đó sai trong mã, có hai loại lỗi chính mà bạn sẽ gặp phải:

- **Lỗi cú pháp**: Đây là lỗi chính tả trong mã của bạn thực sự khiến chương trình không chạy được, hoặc dừng hoạt động ở giữa chừng — bạn thường cũng sẽ nhận được một số thông báo lỗi. Những lỗi này thường không quá khó để sửa, miễn là bạn quen thuộc với các công cụ đúng và biết thông báo lỗi có nghĩa là gì!
- **Lỗi logic**: Đây là các lỗi mà cú pháp thực sự đúng nhưng mã không phải là những gì bạn dự định, có nghĩa là chương trình chạy thành công nhưng cho kết quả không chính xác. Những lỗi này thường khó sửa hơn lỗi cú pháp, vì thường không có thông báo lỗi để chỉ bạn đến nguồn lỗi.

Được rồi, vậy nó không hoàn toàn _đơn giản_ như vậy — có một số phân biệt khác khi bạn đi sâu hơn. Nhưng các phân loại trên sẽ đủ ở giai đoạn đầu trong sự nghiệp của bạn. Chúng ta sẽ xem xét cả hai loại này tiếp tục.

## Một ví dụ có lỗi

Để bắt đầu, hãy quay lại trò chơi đoán số của chúng ta — ngoại trừ lần này chúng ta sẽ khám phá một phiên bản có một số lỗi cố ý được đưa vào. Hãy truy cập GitHub và tạo cho mình một bản sao cục bộ của [number-game-errors.html](https://github.com/mdn/learning-area/blob/main/javascript/introduction-to-js-1/troubleshooting/number-game-errors.html) (xem nó [chạy trực tiếp ở đây](https://mdn.github.io/learning-area/javascript/introduction-to-js-1/troubleshooting/number-game-errors.html)).

1. Để bắt đầu, hãy mở bản sao cục bộ bên trong trình soạn thảo văn bản yêu thích của bạn và trình duyệt của bạn.
2. Hãy thử chơi trò chơi — bạn sẽ nhận thấy rằng khi bạn nhấn nút "Submit guess", nó không hoạt động!

> [!NOTE]
> Bạn có thể có phiên bản ví dụ trò chơi của riêng mình mà không hoạt động, mà bạn có thể muốn sửa! Chúng ta vẫn muốn bạn làm việc qua bài viết với phiên bản của chúng ta, để bạn có thể học các kỹ thuật mà chúng ta đang dạy ở đây. Sau đó bạn có thể quay lại và thử sửa ví dụ của mình.

Tại thời điểm này, hãy tham khảo bảng điều khiển (console) nhà phát triển để xem liệu nó có báo cáo bất kỳ lỗi cú pháp nào không, sau đó thử sửa chúng. Bạn sẽ học cách bên dưới.

## Sửa lỗi cú pháp

Trước đó trong khóa học, chúng ta đã yêu cầu bạn gõ một số lệnh JavaScript đơn giản vào [bảng điều khiển (console) JavaScript của công cụ dành cho nhà phát triển](/en-US/docs/Learn_web_development/Howto/Tools_and_setup/What_are_browser_developer_tools) (nếu bạn không nhớ cách mở nó trong trình duyệt của mình, hãy theo liên kết trước để tìm hiểu cách). Điều hữu ích hơn nữa là bảng điều khiển (console) cung cấp cho bạn thông báo lỗi bất cứ khi nào có lỗi cú pháp bên trong JavaScript được đưa vào công cụ JavaScript của trình duyệt. Bây giờ hãy đi săn.

1. Truy cập tab mà bạn đã mở `number-game-errors.html` và mở bảng điều khiển (console) JavaScript của bạn. Bạn sẽ thấy một thông báo lỗi tương tự như sau: !["Number guessing game" demo page in Firefox. One error is visible in the JavaScript console: "X TypeError: guessSubmit.addeventListener is not a function [Learn More] (number-game-errors.html:87:19)".](not-a-function.png)
2. Dòng đầu tiên của thông báo lỗi là:

   ```plain
   Uncaught TypeError: guessSubmit.addeventListener is not a function
   number-game-errors.html:87:19
   ```

   - Phần đầu tiên, `Uncaught TypeError: guessSubmit.addeventListener is not a function`, đang cho chúng ta biết điều gì đó về những gì đã xảy ra sai.
   - Phần thứ hai, `number-game-errors.html:87:19`, đang cho chúng ta biết lỗi xuất phát từ đâu trong mã: dòng 87, ký tự 19 của tệp "number-game-errors.html".

3. Nếu chúng ta nhìn vào dòng 87 trong trình soạn thảo mã của mình, chúng ta sẽ tìm thấy dòng này:

   ```js
   guessSubmit.addeventListener("click", checkGuess);
   ```

4. Thông báo lỗi nói "guessSubmit.addeventListener is not a function", có nghĩa là hàm chúng ta đang gọi không được nhận dạng bởi trình thông dịch JavaScript. Thường, thông báo lỗi này thực sự có nghĩa là chúng ta đã viết sai thứ gì đó. Nếu bạn không chắc về cách viết đúng của một phần cú pháp, thường tốt khi tra cứu tính năng trên MDN. Cách tốt nhất để làm điều này hiện nay là tìm kiếm "mdn _tên-tính-năng_" với công cụ tìm kiếm yêu thích của bạn. Đây là đường tắt để tiết kiệm một chút thời gian cho bạn trong trường hợp này: [`addEventListener()`](/en-US/docs/Web/API/EventTarget/addEventListener).
5. Vì vậy, nhìn vào trang này, lỗi có vẻ là chúng ta đã viết sai tên hàm! Hãy nhớ rằng JavaScript phân biệt chữ hoa chữ thường, vì vậy bất kỳ sự khác biệt nhỏ nào trong cách viết hoặc viết hoa chữ cái sẽ gây ra lỗi. Thay đổi `addeventListener` thành `addEventListener` sẽ sửa được lỗi này. Hãy thực hiện điều này ngay bây giờ.

> [!NOTE]
> Xem trang tham khảo [TypeError: "x" is not a function](/en-US/docs/Web/JavaScript/Reference/Errors/Not_a_function) của chúng ta để biết thêm chi tiết về lỗi này.

### Lỗi cú pháp vòng hai

1. Lưu trang của bạn và làm mới, và bạn sẽ thấy lỗi đã biến mất.
2. Bây giờ nếu bạn thử nhập đoán và nhấn nút Submit guess, bạn sẽ thấy một lỗi khác! ![Screenshot of the same "Number guessing game" demo. This time, a different error is visible in the console, reading "X TypeError: lowOrHi is null".](variable-is-null.png)
3. Lần này lỗi được báo cáo là:

   ```plain
   Uncaught TypeError: can't access property "textContent", lowOrHi is null
   ```

   Tùy thuộc vào trình duyệt bạn đang sử dụng, bạn có thể thấy một thông báo khác ở đây. Thông báo trên là những gì Firefox sẽ hiển thị cho bạn, nhưng Chrome, ví dụ, sẽ hiển thị cho bạn điều này:

   ```plain
   Uncaught TypeError: Cannot set properties of null (setting 'textContent')
   ```

   Đây là cùng một lỗi, nhưng các trình duyệt khác nhau mô tả nó theo cách khác nhau.

   > [!NOTE]
   > Lỗi này không xuất hiện ngay khi trang được tải vì lỗi này xảy ra bên trong một hàm (bên trong khối `checkGuess() { }`). Như bạn sẽ học chi tiết hơn trong [bài hàm](/en-US/docs/Learn_web_development/Core/Scripting/Functions) của chúng ta, mã bên trong hàm chạy trong một phạm vi riêng biệt so với mã bên ngoài hàm. Trong trường hợp này, mã không được chạy và lỗi không được ném ra cho đến khi hàm `checkGuess()` được chạy bởi dòng 87.

4. Số dòng được đưa ra trong lỗi là 79. Hãy nhìn vào dòng 79, và bạn sẽ thấy mã sau:

   ```js
   lowOrHi.textContent = "Last guess was too high!";
   ```

5. Dòng này đang cố gắng đặt thuộc tính `textContent` của biến `lowOrHi` thành một chuỗi văn bản, nhưng nó không hoạt động vì `lowOrHi` không chứa những gì nó được cho là. Hãy xem tại sao — hãy thử tìm kiếm các trường hợp khác của `lowOrHi` trong mã. Trường hợp sớm nhất bạn sẽ tìm thấy là trên dòng 51:

   ```js
   const lowOrHi = document.querySelector("lowOrHi");
   ```

6. Tại thời điểm này chúng ta đang cố gắng làm cho biến chứa tham chiếu đến một phần tử trong HTML của tài liệu. Hãy xem biến chứa gì sau khi dòng này được chạy. Thêm mã sau trên dòng 54:

   ```js
   console.log(lowOrHi);
   ```

   Mã này sẽ in giá trị của `lowOrHi` vào bảng điều khiển (console) sau khi chúng ta cố gắng đặt nó trong dòng 51. Xem {{domxref("console/log_static", "console.log()")}} để biết thêm thông tin.

7. Lưu và làm mới, và bạn sẽ thấy kết quả `console.log()` trong bảng điều khiển (console) của bạn. ![Screenshot of the same demo. One log statement is visible in the console, reading simply "null".](console-log-output.png) Chắc chắn rồi, giá trị của `lowOrHi` là `null` tại thời điểm này, và điều này khớp với thông báo lỗi Firefox `lowOrHi is null`. Vì vậy, chắc chắn có vấn đề với dòng 51. Giá trị [`null`](/en-US/docs/Web/JavaScript/Reference/Operators/null) có nghĩa là "không có gì", hoặc "không có giá trị". Vì vậy, mã của chúng ta để đặt `lowOrHi` thành một phần tử đang bị sai.

8. Hãy nghĩ về vấn đề có thể là gì. Dòng 51 đang sử dụng phương thức [`document.querySelector()`](/en-US/docs/Web/API/Document/querySelector) để lấy tham chiếu đến một phần tử bằng cách chọn nó với bộ chọn CSS. Nhìn lên trên tệp của chúng ta, chúng ta có thể tìm thấy đoạn văn được đề cập:

   ```html
   <p class="lowOrHi"></p>
   ```

9. Vì vậy, chúng ta cần một bộ chọn lớp ở đây, bắt đầu bằng dấu chấm (`.`), nhưng bộ chọn được truyền vào phương thức `querySelector()` trong dòng 51 không có dấu chấm. Đây có thể là vấn đề! Hãy thử thay đổi `lowOrHi` thành `.lowOrHi` trong dòng 51.
10. Hãy thử lưu và làm mới lại, và câu lệnh `console.log()` của bạn sẽ trả về phần tử `<p>` mà chúng ta muốn. Phew! Một lỗi khác đã được sửa! Bạn có thể xóa dòng `console.log()` ngay bây giờ, hoặc giữ nó để tham khảo sau này — tùy bạn chọn.

> [!NOTE]
> Xem trang tham khảo [TypeError: "x" is (not) "y"](/en-US/docs/Web/JavaScript/Reference/Errors/Unexpected_type) của chúng ta để biết thêm chi tiết về lỗi này.

### Lỗi cú pháp vòng ba

1. Bây giờ nếu bạn thử chơi lại trò chơi, bạn sẽ thành công hơn — trò chơi sẽ chạy hoàn toàn tốt, cho đến khi bạn kết thúc trò chơi, bằng cách đoán đúng số, hoặc bằng cách hết lượt đoán.
2. Tại thời điểm đó, trò chơi lại thất bại, và cùng một lỗi được xuất ra mà chúng ta đã nhận được ở đầu — "TypeError: resetButton.addeventListener is not a function"! Tuy nhiên, lần này nó được liệt kê là xuất phát từ dòng 95.
3. Nhìn vào số dòng 95, thật dễ dàng để thấy rằng chúng ta đã mắc cùng một lỗi ở đây. Chúng ta chỉ cần thay đổi `addeventListener` thành `addEventListener` một lần nữa. Hãy thực hiện điều này ngay bây giờ.

## Một lỗi logic

Tại thời điểm này, trò chơi nên chơi tốt, tuy nhiên sau khi chơi qua một vài lần bạn chắc chắn sẽ nhận thấy rằng trò chơi luôn chọn 1 là số "ngẫu nhiên" mà bạn phải đoán. Chắc chắn không đúng như cách chúng ta muốn trò chơi diễn ra!

Chắc chắn có vấn đề trong logic trò chơi ở đâu đó — trò chơi không trả về lỗi; nó chỉ không chơi đúng.

1. Tìm kiếm biến `randomNumber`, và các dòng nơi số ngẫu nhiên được đặt lần đầu tiên. Trường hợp lưu trữ số ngẫu nhiên mà chúng ta muốn đoán ở đầu trò chơi sẽ xung quanh số dòng 47:

   ```js
   let randomNumber = Math.floor(Math.random()) + 1;
   ```

2. Và cái tạo ra số ngẫu nhiên trước mỗi trò chơi tiếp theo xung quanh dòng 114:

   ```js
   randomNumber = Math.floor(Math.random()) + 1;
   ```

3. Để kiểm tra xem những dòng này có thực sự là vấn đề hay không, hãy chuyển sang người bạn `console.log()` của chúng ta một lần nữa — chèn dòng sau trực tiếp bên dưới mỗi hai dòng trên:

   ```js
   console.log(randomNumber);
   ```

4. Lưu và làm mới, sau đó chơi một vài trò chơi — bạn sẽ thấy rằng `randomNumber` bằng 1 tại mỗi điểm nơi nó được ghi vào bảng điều khiển (console).

### Làm việc qua logic

Để sửa điều này, hãy xem xét dòng này đang hoạt động như thế nào. Đầu tiên, chúng ta gọi [`Math.random()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/random), tạo ra một số thập phân ngẫu nhiên từ 0 đến 1, ví dụ: 0.5675493843.

```js
Math.random();
```

Tiếp theo, chúng ta truyền kết quả của việc gọi `Math.random()` qua [`Math.floor()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/floor), làm tròn số được truyền vào xuống số nguyên gần nhất. Sau đó chúng ta cộng 1 vào kết quả đó:

```js
Math.floor(Math.random()) + 1;
```

Làm tròn xuống một số thập phân ngẫu nhiên từ 0 đến 1 sẽ luôn trả về 0, vì vậy cộng 1 vào nó sẽ luôn trả về 1. Chúng ta cần nhân số ngẫu nhiên với 100 trước khi làm tròn xuống. Đoạn sau sẽ cho chúng ta một số ngẫu nhiên từ 0 đến 99:

```js
Math.floor(Math.random() * 100);
```

Do đó chúng ta muốn cộng 1, để cho chúng ta số ngẫu nhiên từ 1 đến 100:

```js
Math.floor(Math.random() * 100) + 1;
```

Hãy thử cập nhật cả hai dòng như thế này, sau đó lưu và làm mới — trò chơi bây giờ sẽ chơi như chúng ta dự định!

## Các lỗi phổ biến khác

Có các lỗi phổ biến khác bạn sẽ gặp trong mã của mình. Phần này nêu bật hầu hết trong số chúng.

### Trò chơi kết thúc sau lần đoán sai đầu tiên

Đây có thể là triệu chứng khác của việc nhầm lẫn toán tử gán và toán tử so sánh nghiêm ngặt. Ví dụ, nếu chúng ta thay đổi dòng này bên trong `checkGuess()`:

```js
} else if (guessCount === 10) {
```

thành

```js
} else if (guessCount = 10) {
```

bài kiểm tra sẽ luôn trả về `true`, khiến chương trình `setGameOver()` sau lần đoán sai đầu tiên. Hãy cẩn thận!

### SyntaxError: missing ) after argument list

Lỗi này khá đơn giản — nó thường có nghĩa là bạn đã bỏ dấu ngoặc đơn đóng ở cuối lời gọi hàm/phương thức.

> [!NOTE]
> Xem trang tham khảo [SyntaxError: missing ) after argument list](/en-US/docs/Web/JavaScript/Reference/Errors/Missing_parenthesis_after_argument_list) của chúng ta để biết thêm chi tiết về lỗi này.

### SyntaxError: missing : after property id

Lỗi này thường liên quan đến một đối tượng JavaScript được định dạng không đúng, nhưng trong trường hợp này chúng ta đã gây ra nó bằng cách thay đổi

```js
function checkGuess() {
```

thành

```js
function checkGuess( {
```

Điều này làm cho trình duyệt nghĩ rằng chúng ta đang cố gắng truyền nội dung của hàm vào hàm như một đối số. Hãy cẩn thận với những dấu ngoặc đơn đó!

### SyntaxError: missing } after function body

Lỗi này đơn giản — nó thường có nghĩa là bạn đã bỏ một trong các dấu ngoặc nhọn từ một hàm hoặc cấu trúc câu lệnh điều kiện. Chúng ta đã nhận được lỗi này bằng cách xóa một trong các dấu ngoặc nhọn đóng gần cuối hàm `checkGuess()`.

### SyntaxError: expected expression, got '_string_' hoặc SyntaxError: string literal contains an unescaped line break

Những lỗi này thường có nghĩa là bạn đã bỏ dấu nháy mở hoặc đóng của giá trị chuỗi. Trong lỗi đầu tiên ở trên, _string_ sẽ được thay thế bằng các ký tự không mong muốn mà trình duyệt tìm thấy thay vì dấu nháy ở đầu chuỗi. Lỗi thứ hai có nghĩa là chuỗi chưa kết thúc bằng dấu nháy.

Đối với tất cả các lỗi này, hãy nghĩ về cách chúng ta đã giải quyết các ví dụ chúng ta đã xem trong hướng dẫn. Khi một lỗi xuất hiện, hãy nhìn vào số dòng được cho, truy cập dòng đó và xem bạn có thể phát hiện ra vấn đề là gì không. Hãy nhớ rằng lỗi không nhất thiết phải ở trên dòng đó, và cũng không nhất thiết phải do chính xác cùng vấn đề mà chúng ta đã trích dẫn ở trên!

> [!NOTE]
> Xem các trang tham khảo [SyntaxError: Unexpected token](/en-US/docs/Web/JavaScript/Reference/Errors/Unexpected_token) và [SyntaxError: string literal contains an unescaped line break](/en-US/docs/Web/JavaScript/Reference/Errors/String_literal_EOL) của chúng ta để biết thêm chi tiết về các lỗi này.

## Tóm tắt

Vậy là đó, những điều cơ bản để tìm ra lỗi trong các chương trình JavaScript đơn giản. Nó sẽ không phải lúc nào cũng đơn giản như vậy khi tìm ra điều gì đó sai trong mã của bạn, nhưng ít nhất điều này sẽ giúp bạn tiết kiệm vài giờ ngủ và cho phép bạn tiến bộ nhanh hơn một chút khi mọi thứ không diễn ra đúng, đặc biệt trong các giai đoạn đầu trong hành trình học tập của bạn.

## Xem thêm

- Có nhiều loại lỗi khác không được liệt kê ở đây; chúng ta đang biên soạn một tài liệu tham khảo giải thích ý nghĩa của chúng chi tiết — xem [tài liệu tham khảo lỗi JavaScript](/en-US/docs/Web/JavaScript/Reference/Errors).
- Nếu bạn gặp bất kỳ lỗi nào trong mã của mình mà bạn không chắc cách sửa sau khi đọc bài viết này, bạn có thể nhận được giúp đỡ! Hãy hỏi trên [các kênh liên lạc](/en-US/docs/MDN/Community/Communication_channels). Cho chúng ta biết lỗi của bạn là gì và chúng ta sẽ cố gắng giúp bạn. Liệt kê mã của bạn cũng sẽ hữu ích.

{{PreviousMenuNext("Learn_web_development/Core/Scripting/A_first_splash", "Learn_web_development/Core/Scripting/Variables", "Learn_web_development/Core/Scripting")}}
