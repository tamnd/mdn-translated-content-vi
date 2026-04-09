---
title: Cách dùng canvas cơ bản
slug: Web/API/Canvas_API/Tutorial/Basic_usage
page-type: guide
---

{{DefaultAPISidebar("Canvas API")}} {{PreviousNext("Web/API/Canvas_API/Tutorial", "Web/API/Canvas_API/Tutorial/Drawing_shapes")}}

Hãy bắt đầu hướng dẫn này bằng cách xem xét chính phần tử {{HTMLElement("canvas")}} {{Glossary("HTML")}}. Ở cuối trang này, bạn sẽ biết cách thiết lập bối cảnh canvas 2D và đã vẽ một ví dụ đầu tiên trong trình duyệt của mình.

## Phần tử `<canvas>`

```html
<canvas id="canvas" width="150" height="150"></canvas>
```

Thoạt nhìn, {{HTMLElement("canvas")}} trông giống như phần tử {{HTMLElement("img")}}, với điểm khác biệt rõ ràng duy nhất là nó không có các thuộc tính `src` và `alt`. Thật vậy, phần tử `<canvas>` chỉ có hai thuộc tính, [`width`](/en-US/docs/Web/HTML/Reference/Elements/canvas#width) và [`height`](/en-US/docs/Web/HTML/Reference/Elements/canvas#height). Cả hai đều là tùy chọn và cũng có thể được đặt bằng {{Glossary("DOM")}} [properties](/en-US/docs/Web/API/HTMLCanvasElement). Khi không chỉ định thuộc tính `width` và `height`, canvas ban đầu sẽ có chiều rộng **300 pixel** và cao **150 pixel**. Phần tử có thể được điều chỉnh kích thước tùy ý bởi {{Glossary("CSS")}}, nhưng trong quá trình hiển thị, hình ảnh được điều chỉnh tỷ lệ để phù hợp với kích thước bố cục của nó: nếu kích thước CSS không tuân theo tỷ lệ của canvas ban đầu, nó sẽ bị biến dạng.

> [!NOTE]
> Nếu kết xuất của bạn có vẻ bị méo, hãy thử chỉ định rõ ràng các thuộc tính `width` và `height` của bạn trong thuộc tính `<canvas>` và không sử dụng CSS.

Thuộc tính [`id`](/en-US/docs/Web/HTML/Reference/Global_attributes/id) không dành riêng cho phần tử `<canvas>` nhưng là một trong [thuộc tính HTML toàn cầu](/en-US/docs/Web/HTML/Reference/Global_attributes) có thể được áp dụng cho bất kỳ phần tử HTML nào (ví dụ như [`class`](/en-US/docs/Web/HTML/Reference/Global_attributes/class)). Bạn nên cung cấp `id` vì điều này giúp việc xác định nó trong tập lệnh dễ dàng hơn nhiều.

Phần tử `<canvas>` có thể được tạo kiểu giống như bất kỳ hình ảnh bình thường nào ({{cssxref("margin")}}, {{cssxref("border")}}, {{cssxref("background")}}…). Tuy nhiên, những quy tắc này không ảnh hưởng đến bản vẽ thực tế trên canvas. Chúng ta sẽ xem cách thực hiện điều này trong [chương dành riêng](/en-US/docs/Web/API/Canvas_API/Tutorial/Applying_styles_and_colors) của hướng dẫn này. Khi không có quy tắc tạo kiểu nào được áp dụng cho canvas, ban đầu nó sẽ hoàn toàn trong suốt.

### Nội dung có thể truy cập được

Phần tử `<canvas>`, như các phần tử {{HTMLElement("img")}}, {{HTMLElement("video")}}, {{HTMLElement("audio")}} và {{HTMLElement("picture")}}, phải có thể truy cập được bằng cách cung cấp văn bản dự phòng để hiển thị khi phương tiện không tải hoặc người dùng không thể trải nghiệm nó như dự định. Bạn phải luôn cung cấp nội dung dự phòng, chú thích và văn bản thay thế phù hợp với loại phương tiện.

Việc cung cấp nội dung dự phòng rất đơn giản: chỉ cần chèn nội dung thay thế bên trong phần tử `<canvas>` để trình đọc màn hình, trình thu thập thông tin và các bot tự động khác có thể truy cập. Theo mặc định, các trình duyệt sẽ bỏ qua nội dung bên trong vùng chứa, hiển thị canvas bình thường trừ khi `<canvas>` không được hỗ trợ.

Ví dụ: chúng tôi có thể cung cấp mô tả văn bản về nội dung canvas hoặc cung cấp hình ảnh tĩnh của nội dung được hiển thị động. Điều này có thể trông giống như thế này:

```html
<canvas id="stockGraph" width="150" height="150">
  current stock price: $3.15 + 0.15
</canvas>

<canvas id="clock" width="150" height="150">
  <img src="images/clock.png" width="150" height="150" alt="A clock" />
</canvas>
```

Việc yêu cầu người dùng sử dụng một trình duyệt khác hỗ trợ canvas không giúp ích gì cho những người dùng hoàn toàn không thể đọc canvas. Việc cung cấp văn bản dự phòng hữu ích hoặc DOM phụ sẽ bổ sung khả năng truy cập vào một phần tử không thể truy cập được.

### Thẻ `</canvas>` bắt buộc

Do cách cung cấp dự phòng, không giống như phần tử {{HTMLElement("img")}}, phần tử {{HTMLElement("canvas")}} **yêu cầu** thẻ đóng (`</canvas>`). Nếu thẻ này không xuất hiện thì phần còn lại của tài liệu sẽ được coi là nội dung dự phòng và sẽ không được hiển thị.

Nếu không cần nội dung dự phòng, `<canvas id="foo" role="presentation" …></canvas>` đơn giản hoàn toàn tương thích với tất cả các trình duyệt hỗ trợ canvas. Điều này chỉ nên được sử dụng nếu canvas hoàn toàn mang tính trình bày.

## Bối cảnh kết xuất

Phần tử {{HTMLElement("canvas")}} tạo một bề mặt vẽ có kích thước cố định hiển thị một hoặc nhiều **ngữ cảnh kết xuất**, được sử dụng để tạo và thao tác với nội dung được hiển thị. Trong hướng dẫn này, chúng tôi tập trung vào bối cảnh kết xuất 2D. Các bối cảnh khác có thể cung cấp các kiểu hiển thị khác nhau; ví dụ: [WebGL](/en-US/docs/Web/API/WebGL_API) sử dụng ngữ cảnh 3D dựa trên [OpenGL ES](https://www.khronos.org/opengles/).

Canvas ban đầu trống. Để hiển thị nội dung nào đó, trước tiên tập lệnh cần truy cập vào ngữ cảnh hiển thị và vẽ lên nó. Phần tử {{HTMLElement("canvas")}} có một phương thức gọi là {{domxref("HTMLCanvasElement.getContext", "getContext()")}}, được sử dụng để lấy bối cảnh hiển thị và các chức năng vẽ của nó. `getContext()` lấy một tham số, loại ngữ cảnh. Đối với đồ họa 2D, chẳng hạn như đồ họa được đề cập trong hướng dẫn này, bạn chỉ định `"2d"` để nhận {{domxref("CanvasRenderingContext2D")}}.

```js
const canvas = document.getElementById("canvas");
const ctx = canvas.getContext("2d");
```

Dòng đầu tiên trong tập lệnh truy xuất nút trong DOM đại diện cho phần tử {{HTMLElement("canvas")}} bằng cách gọi phương thức {{domxref("document.getElementById()")}}. Khi bạn có nút phần tử, bạn có thể truy cập ngữ cảnh bản vẽ bằng phương thức `getContext()` của nó.

## Đang kiểm tra hỗ trợ

Nội dung dự phòng được hiển thị trong các trình duyệt không hỗ trợ {{HTMLElement("canvas")}}. Các tập lệnh cũng có thể kiểm tra sự hỗ trợ theo chương trình bằng cách kiểm tra sự hiện diện của phương pháp `getContext()`. Đoạn mã của chúng tôi ở trên trở thành như thế này:

```js
const canvas = document.getElementById("canvas");

if (canvas.getContext) {
  const ctx = canvas.getContext("2d");
  // drawing code here
} else {
  // canvas-unsupported code here
}
```

## Mẫu bộ xương

Đây là một mẫu tối giản mà chúng tôi sẽ sử dụng làm điểm khởi đầu cho các ví dụ sau.

> [!NOTE]
> Việc nhúng tập lệnh vào trong HTML không phải là cách hay. Chúng tôi làm điều đó ở đây để giữ cho ví dụ ngắn gọn.

```html
<!doctype html>
<html lang="en-US">
  <head>
    <meta charset="utf-8" />
    <title>Canvas tutorial</title>
    <style>
      canvas {
        border: 1px solid black;
      }
    </style>
  </head>
  <body>
    <canvas id="canvas" width="150" height="150"></canvas>
    <script>
      function draw() {
        const canvas = document.getElementById("canvas");
        const ctx = canvas.getContext("2d");
      }
      draw();
    </script>
  </body>
</html>
```

Tập lệnh bao gồm một hàm có tên `draw()`, được thực thi sau khi trang tải xong; điều này được thực hiện bằng cách đặt tập lệnh sau nội dung chính. Hàm này hoặc một hàm tương tự cũng có thể được gọi bằng cách sử dụng trình xử lý sự kiện {{domxref("Window.setTimeout", "setTimeout()")}}, {{domxref("Window.setInterval", "setInterval()")}} hoặc {{domxref("Window/load_event", "load")}}, miễn là trang được tải trước.

Tại thời điểm này, tài liệu này sẽ được hiển thị trống.

## Một ví dụ đơn giản

Để bắt đầu, chúng ta hãy xem một ví dụ vẽ hai hình chữ nhật giao nhau, một trong số đó có độ trong suốt alpha. Chúng ta sẽ khám phá cách thức hoạt động chi tiết hơn trong các ví dụ sau. Cập nhật nội dung phần tử `script` của bạn thành:

```html hidden
<canvas id="canvas" width="150" height="150"></canvas>
```

```css hidden
canvas {
  border: 1px solid black;
}
```

```js
function draw() {
  const canvas = document.getElementById("canvas");
  const ctx = canvas.getContext("2d");

  ctx.fillStyle = "rgb(200 0 0)";
  ctx.fillRect(10, 10, 50, 50);

  ctx.fillStyle = "rgb(0 0 200 / 50%)";
  ctx.fillRect(30, 30, 50, 50);
}
draw();
```

Ví dụ này trông như thế này:

{{EmbedLiveSample("A_simple_example", "", "160")}}

{{PreviousNext("Web/API/Canvas_API/Tutorial", "Web/API/Canvas_API/Tutorial/Drawing_shapes")}}
