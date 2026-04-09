---
title: Áp dụng kiểu và màu sắc
slug: Web/API/Canvas_API/Tutorial/Applying_styles_and_colors
page-type: guide
---

{{DefaultAPISidebar("Canvas API")}} {{PreviousNext("Web/API/Canvas_API/Tutorial/Drawing_shapes", "Web/API/Canvas_API/Tutorial/Drawing_text")}}

Trong chương về [vẽ hình](/en-US/docs/Web/API/Canvas_API/Tutorial/Drawing_shapes), chúng tôi chỉ sử dụng kiểu đường kẻ và kiểu tô mặc định. Ở đây chúng ta sẽ khám phá các tùy chọn canvas mà chúng ta có sẵn để làm cho bản vẽ của chúng ta hấp dẫn hơn một chút. Bạn sẽ học cách thêm các màu sắc, kiểu đường nét, độ dốc, mẫu và bóng khác nhau vào bản vẽ của mình.

> [!NOTE]
> Trình đọc màn hình không thể truy cập nội dung canvas. Nếu canvas chỉ mang tính chất trang trí, hãy đưa `role="presentation"` vào thẻ mở `<canvas>`. Nếu không, hãy đưa văn bản mô tả làm giá trị của thuộc tính [`aria-label`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-label) trực tiếp trên chính phần tử canvas hoặc bao gồm nội dung dự phòng được đặt trong thẻ canvas mở và đóng. Nội dung canvas không phải là một phần của DOM nhưng nội dung dự phòng lồng nhau thì có.

## Màu sắc

Cho đến nay chúng ta mới chỉ thấy các phương pháp của bối cảnh vẽ. Nếu chúng ta muốn áp dụng màu cho một hình, có hai thuộc tính quan trọng mà chúng ta có thể sử dụng: `fillStyle` và `strokeStyle`.

- {{domxref("CanvasRenderingContext2D.fillStyle", "fillStyle = color")}}
  - : Đặt kiểu được sử dụng khi điền hình.
- {{domxref("CanvasRenderingContext2D.strokeStyle", "strokeStyle = color")}}
  - : Đặt kiểu cho đường viền của hình dạng.

`color` là một chuỗi đại diện cho CSS {{cssxref("&lt;color&gt;")}}, đối tượng chuyển màu hoặc đối tượng mẫu. Chúng ta sẽ xem xét các đối tượng gradient và mẫu sau. Theo mặc định, màu nét và màu tô được đặt thành màu đen (giá trị màu CSS `#000000`).

> [!NOTE]
> Khi bạn đặt thuộc tính `strokeStyle` và/hoặc `fillStyle`, giá trị mới sẽ trở thành mặc định cho tất cả các hình dạng được vẽ từ đó trở đi. Đối với mỗi hình dạng bạn muốn có màu khác nhau, bạn sẽ cần gán lại thuộc tính `fillStyle` hoặc `strokeStyle`.

Theo thông số kỹ thuật, các chuỗi hợp lệ mà bạn có thể nhập phải là giá trị CSS {{cssxref("&lt;color&gt;")}}. Mỗi ví dụ sau đây mô tả cùng một màu.

```js
// these all set the fillStyle to 'orange'

ctx.fillStyle = "orange";
ctx.fillStyle = "#FFA500";
ctx.fillStyle = "rgb(255 165 0)";
ctx.fillStyle = "rgb(255 165 0 / 100%)";
```

### Ví dụ về `fillStyle`

Trong ví dụ này, một lần nữa chúng ta sử dụng hai vòng lặp `for` để vẽ một lưới các hình chữ nhật, mỗi lưới có một màu khác nhau. Hình ảnh thu được sẽ trông giống như ảnh chụp màn hình. Không có gì quá ngoạn mục xảy ra ở đây. Chúng tôi sử dụng hai biến `i` và `j` để tạo màu RGB duy nhất cho mỗi hình vuông và chỉ sửa đổi các giá trị màu đỏ và xanh lục. Kênh màu xanh có giá trị cố định. Bằng cách sửa đổi các kênh, bạn có thể tạo ra tất cả các loại bảng màu. Bằng cách tăng dần các bước, bạn có thể đạt được thứ gì đó trông giống như bảng màu mà Photoshop sử dụng.

```js
function draw() {
  const ctx = document.getElementById("canvas").getContext("2d");
  for (let i = 0; i < 6; i++) {
    for (let j = 0; j < 6; j++) {
      ctx.fillStyle = `rgb(${Math.floor(255 - 42.5 * i)} ${Math.floor(
        255 - 42.5 * j,
      )} 0)`;
      ctx.fillRect(j * 25, i * 25, 25, 25);
    }
  }
}
```

```html hidden
<canvas id="canvas" width="150" height="150"
  >A 6 by 6 square grid displaying 36 different colors</canvas
>
```

```js hidden
draw();
```

Kết quả trông như thế này:

{{EmbedLiveSample("A_fillStyle_example", "", "160")}}

### Ví dụ về `strokeStyle`

Ví dụ này tương tự như ví dụ ở trên, nhưng sử dụng thuộc tính `strokeStyle` để thay đổi màu sắc của đường viền của hình dạng. Chúng tôi sử dụng phương pháp `arc()` để vẽ hình tròn thay vì hình vuông.

```js
function draw() {
  const ctx = document.getElementById("canvas").getContext("2d");
  for (let i = 0; i < 6; i++) {
    for (let j = 0; j < 6; j++) {
      ctx.strokeStyle = `rgb(0 ${Math.floor(255 - 42.5 * i)} ${Math.floor(
        255 - 42.5 * j,
      )})`;
      ctx.beginPath();
      ctx.arc(12.5 + j * 25, 12.5 + i * 25, 10, 0, 2 * Math.PI, true);
      ctx.stroke();
    }
  }
}
```

```html hidden
<canvas id="canvas" width="150" height="150" role="presentation"></canvas>
```

```js hidden
draw();
```

Kết quả trông như thế này:

{{EmbedLiveSample("A_strokeStyle_example", "", "160")}}

## Minh bạch

Ngoài việc vẽ các hình mờ lên canvas, chúng ta cũng có thể vẽ các hình bán trong suốt (hoặc mờ). Điều này được thực hiện bằng cách đặt thuộc tính `globalAlpha` hoặc bằng cách gán màu bán trong suốt cho nét và/hoặc kiểu tô màu.

- {{domxref("CanvasRenderingContext2D.globalAlpha", "globalAlpha = transparencyValue")}}
  - : Áp dụng giá trị trong suốt đã chỉ định cho tất cả các hình dạng trong tương lai được vẽ trên khung vẽ. Giá trị phải nằm trong khoảng từ 0,0 (hoàn toàn trong suốt) đến 1,0 (hoàn toàn mờ). Giá trị này theo mặc định là 1,0 (hoàn toàn mờ).

Thuộc tính `globalAlpha` có thể hữu ích nếu bạn muốn vẽ nhiều hình trên khung vẽ với độ trong suốt tương tự, nhưng mặt khác, nói chung sẽ hữu ích hơn khi đặt độ trong suốt trên từng hình dạng khi đặt màu của chúng.

Vì thuộc tính `strokeStyle` và `fillStyle` chấp nhận giá trị màu CSS rgb nên chúng ta có thể sử dụng ký hiệu sau để gán màu trong suốt cho chúng.

```js
// Assigning transparent colors to stroke and fill style

ctx.strokeStyle = "rgb(255 0 0 / 50%)";
ctx.fillStyle = "rgb(255 0 0 / 50%)";
```

Hàm `rgb()` có một tham số bổ sung tùy chọn. Tham số cuối cùng đặt giá trị trong suốt của màu cụ thể này. Phạm vi hợp lệ được chỉ định dưới dạng phần trăm giữa `0%` (hoàn toàn trong suốt) và `100%` (hoàn toàn mờ) hoặc dưới dạng số giữa `0.0` (tương đương với `0%`) và `1.0` (tương đương với `100%`).

### Ví dụ về `globalAlpha`

Trong ví dụ này, chúng ta sẽ vẽ nền gồm bốn hình vuông có màu khác nhau. Trên hết, chúng ta sẽ vẽ một tập hợp các vòng tròn bán trong suốt. Thuộc tính `globalAlpha` được đặt ở `0.2`, thuộc tính này sẽ được sử dụng cho tất cả các hình dạng kể từ thời điểm đó trở đi. Mỗi bước trong vòng lặp `for` vẽ một tập hợp các vòng tròn có bán kính tăng dần. Kết quả cuối cùng là một gradient xuyên tâm. Bằng cách chồng nhiều vòng tròn lên nhau, chúng tôi giảm độ trong suốt của các vòng tròn đã được vẽ một cách hiệu quả. Bằng cách tăng số bước và thực tế là vẽ nhiều vòng tròn hơn, nền sẽ hoàn toàn biến mất khỏi giữa hình ảnh.

```js
function draw() {
  const ctx = document.getElementById("canvas").getContext("2d");
  // draw background
  ctx.fillStyle = "#ffdd00";
  ctx.fillRect(0, 0, 75, 75);
  ctx.fillStyle = "#66cc00";
  ctx.fillRect(75, 0, 75, 75);
  ctx.fillStyle = "#0099ff";
  ctx.fillRect(0, 75, 75, 75);
  ctx.fillStyle = "#ff3300";
  ctx.fillRect(75, 75, 75, 75);
  ctx.fillStyle = "white";

  // set transparency value
  ctx.globalAlpha = 0.2;

  // Draw semi transparent circles
  for (let i = 0; i < 7; i++) {
    ctx.beginPath();
    ctx.arc(75, 75, 10 + 10 * i, 0, Math.PI * 2, true);
    ctx.fill();
  }
}
```

```html hidden
<canvas id="canvas" width="150" height="150" role="presentation"></canvas>
```

```js hidden
draw();
```

{{EmbedLiveSample("A_globalAlpha_example", "", "160")}}

### Một ví dụ sử dụng `rgb()` với độ trong suốt alpha

Trong ví dụ thứ hai này, chúng ta làm điều gì đó tương tự như ví dụ trên, nhưng thay vì vẽ các vòng tròn chồng lên nhau, tôi đã vẽ các hình chữ nhật nhỏ với độ mờ tăng dần. Sử dụng `rgb()` mang lại cho bạn khả năng kiểm soát và linh hoạt hơn một chút vì chúng ta có thể đặt kiểu tô và nét riêng lẻ.

```js
function draw() {
  const ctx = document.getElementById("canvas").getContext("2d");

  // Draw background
  ctx.fillStyle = "rgb(255 221 0)";
  ctx.fillRect(0, 0, 150, 37.5);
  ctx.fillStyle = "rgb(102 204 0)";
  ctx.fillRect(0, 37.5, 150, 37.5);
  ctx.fillStyle = "rgb(0 153 255)";
  ctx.fillRect(0, 75, 150, 37.5);
  ctx.fillStyle = "rgb(255 51 0)";
  ctx.fillRect(0, 112.5, 150, 37.5);

  // Draw semi transparent rectangles
  for (let i = 0; i < 10; i++) {
    ctx.fillStyle = `rgb(255 255 255 / ${(i + 1) / 10})`;
    for (let j = 0; j < 4; j++) {
      ctx.fillRect(5 + i * 14, 5 + j * 37.5, 14, 27.5);
    }
  }
}
```

```html hidden
<canvas id="canvas" width="150" height="150" role="presentation"></canvas>
```

```js hidden
draw();
```

{{EmbedLiveSample("An_example_using_rgb_with_alpha_transparency", "", "160")}}

## Kiểu đường kẻ

Có một số thuộc tính cho phép chúng ta tạo kiểu cho các dòng.

- {{domxref("CanvasRenderingContext2D.lineWidth", "lineWidth = value")}}
  - : Thiết lập độ rộng của đường vẽ trong tương lai.
- {{domxref("CanvasRenderingContext2D.lineCap", "lineCap = type")}}
  - : Thiết lập sự xuất hiện của phần cuối của dòng.
- {{domxref("CanvasRenderingContext2D.lineJoin", "lineJoin = type")}}
  - : Đặt hình thức của các "góc" nơi các đường giao nhau.
- {{domxref("CanvasRenderingContext2D.miterLimit", "miterLimit = value")}}
  - : Thiết lập giới hạn trên góc vát khi hai đường nối với nhau ở một góc nhọn, để cho phép bạn kiểm soát độ dày của đường giao nhau.
- {{domxref("CanvasRenderingContext2D.getLineDash", "getLineDash()")}}
  - : Trả về mảng mẫu gạch ngang dòng hiện tại chứa số chẵn các số không âm.
- {{domxref("CanvasRenderingContext2D.setLineDash", "setLineDash(segments)")}}
  - : Đặt mẫu gạch ngang hiện tại.
- {{domxref("CanvasRenderingContext2D.lineDashOffset", "lineDashOffset = value")}}
  - : Chỉ định vị trí bắt đầu một mảng gạch ngang trên một dòng.

Bạn sẽ hiểu rõ hơn về những gì chúng làm bằng cách xem các ví dụ bên dưới.

### Ví dụ về `lineWidth`

Thuộc tính này thiết lập độ dày của đường hiện tại. Giá trị phải là số dương. Theo mặc định, giá trị này được đặt thành 1,0 đơn vị.

Độ rộng của đường là độ dày của nét có tâm trên đường dẫn đã cho. Nói cách khác, khu vực được vẽ mở rộng bằng một nửa chiều rộng đường ở hai bên của đường dẫn. Vì tọa độ canvas không tham chiếu trực tiếp các pixel nên phải đặc biệt chú ý để có được các đường ngang và dọc rõ nét.

Trong ví dụ dưới đây, 10 đường thẳng được vẽ với độ rộng đường tăng dần. Đường ở phía bên trái rộng 1,0 đơn vị. Tuy nhiên, các đường có độ dày ngoài cùng bên trái và tất cả các đường có chiều rộng số nguyên lẻ khác không xuất hiện sắc nét do vị trí của đường dẫn.

```js
function draw() {
  const ctx = document.getElementById("canvas").getContext("2d");
  for (let i = 0; i < 10; i++) {
    ctx.lineWidth = 1 + i;
    ctx.beginPath();
    ctx.moveTo(5 + i * 14, 5);
    ctx.lineTo(5 + i * 14, 140);
    ctx.stroke();
  }
}
```

```html hidden
<canvas id="canvas" width="150" height="150" role="presentation"></canvas>
```

```js hidden
draw();
```

{{EmbedLiveSample("A_lineWidth_example", "", "160")}}

> [!NOTE]
> Nếu bạn thắc mắc về các đường xuất hiện màu xám gần cạnh thay vì màu đen, hãy kiểm tra phần [Thấy các cạnh mờ?](/en-US/docs/Web/API/Canvas_API/Tutorial/Drawing_shapes#seeing_blurry_edges) ở chương trước.

### Ví dụ về `lineCap`

Thuộc tính `lineCap` xác định cách vẽ điểm cuối của mỗi đường. Có ba giá trị có thể có cho thuộc tính này và đó là: `butt`, `round` và `square`. Theo mặc định, thuộc tính này được đặt thành `butt`:

- `butt`
  - : Các đầu của dòng được bình phương tại điểm cuối.
- `round`
  - : Các đầu dòng được làm tròn.
- `square`
  - : Các đầu của đường thẳng được bình phương bằng cách thêm một hộp có chiều rộng bằng nhau và chiều cao bằng một nửa độ dày của đường thẳng.

Chỉ điểm đầu và điểm cuối của đường dẫn bị ảnh hưởng: nếu đường dẫn được đóng bằng `closePath()` thì không có điểm bắt đầu và điểm cuối cuối cùng; thay vào đó, tất cả các điểm cuối trong đường dẫn được kết nối với phân đoạn trước và phân đoạn tiếp theo được đính kèm bằng cách sử dụng cài đặt hiện tại của kiểu `lineJoin`.

Trong ví dụ này, chúng ta sẽ vẽ ba đường, mỗi đường có một giá trị khác nhau cho thuộc tính `lineCap`. Tôi cũng đã thêm hai hướng dẫn để thấy sự khác biệt chính xác giữa ba hướng dẫn này. Mỗi dòng này bắt đầu và kết thúc chính xác trên các hướng dẫn này.

Dòng bên trái sử dụng tùy chọn `butt` mặc định. Bạn sẽ nhận thấy rằng nó được vẽ hoàn toàn ngang bằng với các đường dẫn. Cái thứ hai được đặt để sử dụng tùy chọn `round`. Điều này thêm một hình bán nguyệt vào cuối có bán kính bằng một nửa chiều rộng của đường thẳng. Dòng bên phải sử dụng tùy chọn `square`. Điều này thêm một hộp có chiều rộng bằng nhau và một nửa chiều cao của độ dày đường.

```js
function draw() {
  const ctx = document.getElementById("canvas").getContext("2d");

  // Draw guides
  ctx.strokeStyle = "#0099ff";
  ctx.beginPath();
  ctx.moveTo(10, 10);
  ctx.lineTo(140, 10);
  ctx.moveTo(10, 140);
  ctx.lineTo(140, 140);
  ctx.stroke();

  // Draw lines
  ctx.strokeStyle = "black";
  ["butt", "round", "square"].forEach((lineCap, i) => {
    ctx.lineWidth = 15;
    ctx.lineCap = lineCap;
    ctx.beginPath();
    ctx.moveTo(25 + i * 50, 10);
    ctx.lineTo(25 + i * 50, 140);
    ctx.stroke();
  });
}
```

```html hidden
<canvas id="canvas" width="150" height="150" role="presentation"></canvas>
```

```js hidden
draw();
```

{{EmbedLiveSample("A_lineCap_example", "", "160")}}

### Ví dụ về `lineJoin`

Thuộc tính `lineJoin` xác định cách hai đoạn kết nối (đường, cung hoặc đường cong) có độ dài khác 0 trong một hình được nối với nhau (các đoạn suy biến có độ dài bằng 0, có điểm cuối và điểm kiểm soát được chỉ định chính xác ở cùng một vị trí, sẽ bị bỏ qua).

Có ba giá trị có thể có cho thuộc tính này: `round`, `bevel` và `miter`. Theo mặc định, thuộc tính này được đặt thành `miter`. Lưu ý rằng cài đặt `lineJoin` không có hiệu lực nếu hai đoạn được kết nối có cùng hướng, vì sẽ không có vùng nối nào được thêm vào trong trường hợp này:

- `round`
  - : Làm tròn các góc của hình bằng cách lấp đầy một cung đĩa bổ sung ở giữa điểm cuối chung của các đoạn được kết nối. Bán kính của các góc tròn này bằng một nửa chiều rộng của đường thẳng.
- `bevel`
  - : Lấp đầy một vùng hình tam giác bổ sung giữa điểm cuối chung của các đoạn được kết nối và các góc hình chữ nhật bên ngoài riêng biệt của mỗi đoạn.
- `miter`
  - : Các đoạn đã kết nối được nối với nhau bằng cách mở rộng các cạnh bên ngoài của chúng để kết nối tại một điểm duy nhất, với tác dụng lấp đầy một khu vực hình thoi bổ sung. Cài đặt này được thực hiện bởi thuộc tính `miterLimit` được giải thích bên dưới.

Ví dụ bên dưới vẽ ba đường dẫn khác nhau, thể hiện từng đường dẫn trong số ba cài đặt thuộc tính `lineJoin` này; đầu ra được hiển thị ở trên.

```js
function draw() {
  const ctx = document.getElementById("canvas").getContext("2d");
  ctx.lineWidth = 10;
  ["round", "bevel", "miter"].forEach((lineJoin, i) => {
    ctx.lineJoin = lineJoin;
    ctx.beginPath();
    ctx.moveTo(-5, 5 + i * 40);
    ctx.lineTo(35, 45 + i * 40);
    ctx.lineTo(75, 5 + i * 40);
    ctx.lineTo(115, 45 + i * 40);
    ctx.lineTo(155, 5 + i * 40);
    ctx.stroke();
  });
}
```

```html hidden
<canvas id="canvas" width="150" height="150" role="presentation"></canvas>
```

```js hidden
draw();
```

{{EmbedLiveSample("A_lineJoin_example", "", "160")}}

### Bản demo của thuộc tính `miterLimit`

Như bạn đã thấy trong ví dụ trước, khi nối hai đường bằng tùy chọn `miter`, các cạnh bên ngoài của hai đường nối sẽ được kéo dài đến điểm chúng gặp nhau. Đối với các đường có góc lớn với nhau thì điểm này cách điểm nối bên trong không xa. Tuy nhiên, khi góc giữa mỗi đường giảm, khoảng cách (chiều dài góc 1) giữa các điểm này sẽ tăng theo cấp số nhân.

Thuộc tính `miterLimit` xác định khoảng cách giữa điểm kết nối bên ngoài và điểm kết nối bên trong. Nếu hai đường vượt quá giá trị này, thay vào đó, một đường nối góc xiên sẽ được vẽ. Lưu ý rằng độ dài góc tối đa là tích của chiều rộng đường được đo trong hệ tọa độ hiện tại, bằng giá trị của thuộc tính `miterLimit` này (có giá trị mặc định là 10,0 trong HTML {{HTMLElement("canvas")}}), do đó `miterLimit` có thể được đặt độc lập với tỷ lệ hiển thị hiện tại hoặc bất kỳ phép biến đổi affine nào của đường dẫn: nó chỉ ảnh hưởng đến hình dạng được hiển thị hiệu quả của các cạnh đường.

Chính xác hơn, giới hạn góc cắt là tỷ lệ tối đa được phép của chiều dài phần mở rộng (trong canvas HTML, nó được đo giữa góc ngoài của các cạnh được nối của đường và điểm cuối chung của các đoạn kết nối được chỉ định trong đường dẫn) đến một nửa chiều rộng của đường. Nó có thể được định nghĩa tương đương là tỷ lệ tối đa được phép của khoảng cách giữa các điểm bên trong và bên ngoài của điểm giao nhau của các cạnh với tổng chiều rộng của đường. Khi đó, nó bằng cosec của một nửa góc trong tối thiểu của các đoạn kết nối bên dưới mà không có đường nối góc nào được hiển thị mà chỉ có đường nối góc xiên:

- `miterLimit` = **max** `miterLength` / `lineWidth` = 1 / **sin** ( **min** _θ_ / 2 )
- Giới hạn góc vát mặc định là 10,0 sẽ loại bỏ tất cả các góc vát đối với các góc nhọn dưới khoảng 11 độ.
- Giới hạn góc vát bằng √2 ≈ 1.4142136 (làm tròn) sẽ loại bỏ các góc vát đối với tất cả các góc nhọn, chỉ giữ các mối nối góc vát đối với các góc tù hoặc góc vuông.
- Giới hạn giới hạn bằng 1.0 là hợp lệ nhưng sẽ vô hiệu hóa tất cả các giới hạn.
- Các giá trị dưới 1,0 không hợp lệ đối với giới hạn góc cắt.

Đây là một bản demo nhỏ trong đó bạn có thể đặt `miterLimit` một cách linh hoạt và xem điều này ảnh hưởng như thế nào đến các hình dạng trên khung vẽ. Các đường màu xanh hiển thị điểm bắt đầu và điểm kết thúc của từng đường trong mẫu hình zig-zag.

Nếu bạn chỉ định giá trị `miterLimit` dưới 4.2 trong bản demo này, thì không có góc nhìn thấy nào sẽ kết hợp với phần mở rộng góc vát mà chỉ có một góc xiên nhỏ gần các đường màu xanh lam; với `miterLimit` trên 10, hầu hết các góc trong bản demo này phải nối với một góc vát cách xa các đường màu xanh lam và có chiều cao giảm dần giữa các góc từ trái sang phải vì chúng kết nối với các góc đang phát triển; với các giá trị trung gian, các góc ở phía bên trái sẽ chỉ nối với một góc xiên gần các đường màu xanh lam và các góc ở phía bên phải có phần mở rộng góc vát (cũng có chiều cao giảm dần).

```js
function draw() {
  const ctx = document.getElementById("canvas").getContext("2d");

  // Clear canvas
  ctx.clearRect(0, 0, 150, 150);

  // Draw guides
  ctx.strokeStyle = "#0099ff";
  ctx.lineWidth = 2;
  ctx.strokeRect(-5, 50, 160, 50);

  // Set line styles
  ctx.strokeStyle = "black";
  ctx.lineWidth = 10;

  // check input
  if (document.getElementById("miterLimit").checkValidity()) {
    ctx.miterLimit = parseFloat(document.getElementById("miterLimit").value);
  }

  // Draw lines
  ctx.beginPath();
  ctx.moveTo(0, 100);
  for (let i = 0; i < 24; i++) {
    const dy = i % 2 === 0 ? 25 : -25;
    ctx.lineTo(i ** 1.5 * 2, 75 + dy);
  }
  ctx.stroke();
  return false;
}
```

```html hidden
<canvas id="canvas" width="150" height="150" role="presentation"></canvas>
<div>
  Change the <code>miterLimit</code> by entering a new value below and clicking
  the redraw button.<br /><br />
  <label for="miterLimit">Miter limit</label>
  <input type="number" id="miterLimit" min="1" />
  <button id="redraw">Redraw</button>
</div>
```

```css hidden
body {
  display: flex;
}
```

```js hidden
document.getElementById("miterLimit").value = document
  .getElementById("canvas")
  .getContext("2d").miterLimit;
draw();

const redraw = document.getElementById("redraw");
redraw.addEventListener("click", draw);
```

{{EmbedLiveSample("A_demo_of_the_miterLimit_property", "", "180")}}

### Sử dụng dấu gạch ngang

Phương thức `setLineDash` và thuộc tính `lineDashOffset` chỉ định mẫu gạch ngang cho các dòng. Phương thức `setLineDash` chấp nhận danh sách các số chỉ định khoảng cách để lần lượt vẽ một đường và một khoảng cách, đồng thời thuộc tính `lineDashOffset` đặt phần bù ở vị trí bắt đầu mẫu.

Trong ví dụ này, chúng ta đang tạo hiệu ứng đàn kiến ​​diễu hành. Nó là một kỹ thuật hoạt ảnh thường thấy trong các công cụ lựa chọn của các chương trình đồ họa máy tính. Nó giúp người dùng phân biệt đường viền lựa chọn với nền hình ảnh bằng cách tạo hiệu ứng cho đường viền. Trong phần sau của hướng dẫn này, bạn có thể tìm hiểu cách thực hiện điều này và các [hoạt ảnh cơ bản](/en-US/docs/Web/API/Canvas_API/Tutorial/Basic_animations).

```html hidden
<canvas id="canvas" width="111" height="111" role="presentation"></canvas>
```

```js
const ctx = document.getElementById("canvas").getContext("2d");
let offset = 0;

function draw() {
  ctx.clearRect(0, 0, canvas.width, canvas.height);
  ctx.setLineDash([4, 2]);
  ctx.lineDashOffset = -offset;
  ctx.strokeRect(10, 10, 100, 100);
}

function march() {
  offset++;
  if (offset > 5) {
    offset = 0;
  }
  draw();
  setTimeout(march, 20);
}

march();
```

{{EmbedLiveSample("Using_line_dashes")}}

## Độ dốc

Cũng giống như bất kỳ chương trình vẽ thông thường nào, chúng ta có thể tô và vẽ các hình dạng bằng cách sử dụng các gradient tuyến tính, xuyên tâm và hình nón. Chúng tôi tạo đối tượng {{domxref("CanvasGradient")}} bằng cách sử dụng một trong các phương pháp sau. Sau đó chúng ta có thể gán đối tượng này cho thuộc tính `fillStyle` hoặc `strokeStyle`.

- {{domxref("CanvasRenderingContext2D.createLinearGradient", "createLinearGradient(x1, y1, x2, y2)")}}
  - : Tạo một đối tượng gradient tuyến tính có điểm bắt đầu là (`x1`, `y1`) và điểm kết thúc là (`x2`, `y2`).
- {{domxref("CanvasRenderingContext2D.createRadialGradient", "createRadialGradient(x1, y1, r1, x2, y2, r2)")}}
  - : Tạo một gradient xuyên tâm. Các tham số biểu thị hai vòng tròn, một vòng tròn có tâm tại (`x1`, `y1`) và bán kính `r1`, vòng còn lại có tâm tại (`x2`, `y2`) với bán kính `r2`.
- {{domxref("CanvasRenderingContext2D.createConicGradient", "createConicGradient(angle, x, y)")}}
  - : Tạo đối tượng gradient hình nón có góc bắt đầu là `angle` tính bằng radian, tại vị trí (`x`, `y`).

Ví dụ:

```js
const lineargradient = ctx.createLinearGradient(0, 0, 150, 150);
const radialgradient = ctx.createRadialGradient(75, 75, 0, 75, 75, 100);
```

Khi chúng ta đã tạo một đối tượng `CanvasGradient`, chúng ta có thể gán màu cho nó bằng cách sử dụng phương thức `addColorStop()`.

- {{domxref("CanvasGradient.addColorStop", "gradient.addColorStop(position, color)")}}
  - : Tạo điểm dừng màu mới trên đối tượng `gradient`. `position` là một số từ 0,0 đến 1,0 và xác định vị trí tương đối của màu trong dải màu và đối số `color` phải là một chuỗi biểu thị CSS {{cssxref("&lt;color&gt;")}}, cho biết màu mà dải màu sẽ đạt đến ở điểm bù đó trong quá trình chuyển đổi.

Bạn có thể thêm bao nhiêu điểm dừng màu vào một dải màu tùy ý. Dưới đây là một gradient tuyến tính rất đơn giản từ trắng sang đen.

```js
const lineargradient = ctx.createLinearGradient(0, 0, 150, 150);
lineargradient.addColorStop(0, "white");
lineargradient.addColorStop(1, "black");
```

### Ví dụ về `createLinearGradient`

Trong ví dụ này, chúng ta sẽ tạo hai gradient khác nhau. Như bạn có thể thấy ở đây, cả thuộc tính `strokeStyle` và `fillStyle` đều có thể chấp nhận đối tượng `canvasGradient` làm đầu vào hợp lệ.

```js
function draw() {
  const ctx = document.getElementById("canvas").getContext("2d");

  // Create gradients
  const linGrad = ctx.createLinearGradient(0, 0, 0, 150);
  linGrad.addColorStop(0, "#00ABEB");
  linGrad.addColorStop(0.5, "white");
  linGrad.addColorStop(0.5, "#26C000");
  linGrad.addColorStop(1, "white");

  const linGrad2 = ctx.createLinearGradient(0, 50, 0, 95);
  linGrad2.addColorStop(0.5, "black");
  linGrad2.addColorStop(1, "transparent");

  // assign gradients to fill and stroke styles
  ctx.fillStyle = linGrad;
  ctx.strokeStyle = linGrad2;

  // draw shapes
  ctx.fillRect(10, 10, 130, 130);
  ctx.strokeRect(50, 50, 50, 50);
}
```

```html hidden
<canvas id="canvas" width="150" height="150" role="presentation"></canvas>
```

```js hidden
draw();
```

Đầu tiên là độ dốc nền. Như bạn có thể thấy, chúng tôi đã gán hai màu ở cùng một vị trí. Bạn làm điều này để thực hiện những chuyển đổi màu sắc thật sắc nét—trong trường hợp này là từ trắng sang xanh lục. Thông thường, việc bạn xác định các điểm dừng màu theo thứ tự nào không quan trọng, nhưng trong trường hợp đặc biệt này, điều đó có tác dụng đáng kể. Nếu bạn giữ các bài tập theo thứ tự bạn muốn chúng xuất hiện thì điều này sẽ không thành vấn đề.

Trong gradient thứ hai, chúng tôi không chỉ định màu bắt đầu (ở vị trí 0,0) vì nó không thực sự cần thiết vì nó sẽ tự động lấy màu của điểm dừng màu tiếp theo. Do đó, việc gán màu đen ở vị trí 0,5 sẽ tự động làm cho độ dốc, từ điểm bắt đầu đến điểm dừng này, có màu đen.

{{EmbedLiveSample("A_createLinearGradient_example", "", "160")}}

### Ví dụ về `createRadialGradient`

Trong ví dụ này, chúng tôi sẽ xác định bốn gradient xuyên tâm khác nhau. Bởi vì chúng ta có quyền kiểm soát các điểm bắt đầu và kết thúc của dải chuyển màu, nên chúng ta có thể đạt được các hiệu ứng phức tạp hơn bình thường trong các dải chuyển màu xuyên tâm "cổ điển" mà chúng ta thấy trong Photoshop (nghĩa là một dải chuyển màu có một điểm trung tâm duy nhất trong đó dải chuyển màu mở rộng ra bên ngoài theo hình tròn).

```js
function draw() {
  const ctx = document.getElementById("canvas").getContext("2d");

  // Create gradients
  const radGrad = ctx.createRadialGradient(45, 45, 10, 52, 50, 30);
  radGrad.addColorStop(0, "#A7D30C");
  radGrad.addColorStop(0.9, "#019F62");
  radGrad.addColorStop(1, "transparent");

  const radGrad2 = ctx.createRadialGradient(105, 105, 20, 112, 120, 50);
  radGrad2.addColorStop(0, "#FF5F98");
  radGrad2.addColorStop(0.75, "#FF0188");
  radGrad2.addColorStop(1, "transparent");

  const radGrad3 = ctx.createRadialGradient(95, 15, 15, 102, 20, 40);
  radGrad3.addColorStop(0, "#00C9FF");
  radGrad3.addColorStop(0.8, "#00B5E2");
  radGrad3.addColorStop(1, "transparent");

  const radGrad4 = ctx.createRadialGradient(0, 150, 50, 0, 140, 90);
  radGrad4.addColorStop(0, "#F4F201");
  radGrad4.addColorStop(0.8, "#E4C700");
  radGrad4.addColorStop(1, "transparent");

  // draw shapes
  ctx.fillStyle = radGrad4;
  ctx.fillRect(0, 0, 150, 150);
  ctx.fillStyle = radGrad3;
  ctx.fillRect(0, 0, 150, 150);
  ctx.fillStyle = radGrad2;
  ctx.fillRect(0, 0, 150, 150);
  ctx.fillStyle = radGrad;
  ctx.fillRect(0, 0, 150, 150);
}
```

```html hidden
<canvas id="canvas" width="150" height="150" role="presentation"></canvas>
```

```js hidden
draw();
```

Trong trường hợp này, chúng tôi đã dịch chuyển điểm bắt đầu một chút so với điểm kết thúc để đạt được hiệu ứng 3D hình cầu. Tốt nhất bạn nên cố gắng tránh để các vòng tròn bên trong và bên ngoài chồng lên nhau vì điều này sẽ dẫn đến những hiệu ứng kỳ lạ khó dự đoán.

Điểm dừng màu cuối cùng trong mỗi gradient trong số bốn gradient sử dụng màu hoàn toàn trong suốt. Nếu bạn muốn có sự chuyển đổi đẹp mắt từ điểm dừng màu này sang điểm dừng màu trước đó, cả hai màu phải bằng nhau. Điều này không được thể hiện rõ ràng trong mã vì nó sử dụng hai phương thức màu CSS khác nhau để minh họa, nhưng ở gradient đầu tiên là `#019F62 = rgb(1 159 98 / 100%)`.

{{EmbedLiveSample("A_createRadialGradient_example", "", "160")}}

### Ví dụ về `createConicGradient`

Trong ví dụ này, chúng tôi sẽ xác định hai gradient hình nón khác nhau. Một gradient hình nón khác với một gradient xuyên tâm ở chỗ, thay vì tạo ra các vòng tròn, nó xoay quanh một điểm.

```js
function draw() {
  const ctx = document.getElementById("canvas").getContext("2d");

  // Create gradients
  const conicGrad1 = ctx.createConicGradient(2, 62, 75);
  conicGrad1.addColorStop(0, "#A7D30C");
  conicGrad1.addColorStop(1, "white");

  const conicGrad2 = ctx.createConicGradient(0, 187, 75);
  // we multiply our values by Math.PI/180 to convert degrees to radians
  conicGrad2.addColorStop(0, "black");
  conicGrad2.addColorStop(0.25, "black");
  conicGrad2.addColorStop(0.25, "white");
  conicGrad2.addColorStop(0.5, "white");
  conicGrad2.addColorStop(0.5, "black");
  conicGrad2.addColorStop(0.75, "black");
  conicGrad2.addColorStop(0.75, "white");
  conicGrad2.addColorStop(1, "white");

  // draw shapes
  ctx.fillStyle = conicGrad1;
  ctx.fillRect(12, 25, 100, 100);
  ctx.fillStyle = conicGrad2;
  ctx.fillRect(137, 25, 100, 100);
}
```

```html hidden
<canvas id="canvas" width="250" height="150" role="presentation"
  >A conic gradient</canvas
>
```

```js hidden
draw();
```

Dải màu chuyển màu đầu tiên được đặt ở giữa hình chữ nhật đầu tiên và di chuyển điểm dừng màu xanh lục ở đầu, sang điểm dừng màu trắng ở cuối. Góc bắt đầu ở 2 radian, điều này dễ nhận thấy vì đường đầu/cuối hướng về phía đông nam.

Dải màu chuyển sắc thứ hai cũng được đặt ở giữa hình chữ nhật thứ hai. Cái này có nhiều điểm dừng màu, xen kẽ từ đen sang trắng ở mỗi phần tư vòng quay. Điều này mang lại cho chúng ta hiệu ứng ca rô.

{{EmbedLiveSample("A_createConicGradient_example", "", "160")}}

## Mẫu

Trong một trong các ví dụ ở trang trước, chúng ta đã sử dụng một loạt vòng lặp để tạo ra một mẫu hình ảnh. Tuy nhiên, có một phương pháp đơn giản hơn nhiều: phương pháp `createPattern()`.

- {{domxref("CanvasRenderingContext2D.createPattern", "createPattern(image, type)")}}
  - : Tạo và trả về một đối tượng mẫu canvas mới. `image` là nguồn của hình ảnh (nghĩa là {{domxref("HTMLImageElement")}}, {{domxref("SVGImageElement")}}, {{domxref("HTMLCanvasElement")}} khác hoặc {{domxref("OffscreenCanvas")}}, {{domxref("HTMLVideoElement")}} hoặc {{domxref("VideoFrame")}} hoặc {{domxref("ImageBitmap")}}). `type` là một chuỗi chỉ ra cách sử dụng hình ảnh.

Loại chỉ định cách sử dụng hình ảnh để tạo mẫu và phải là một trong các giá trị chuỗi sau:

- `repeat`
  - : Xếp hình ảnh theo cả chiều dọc và chiều ngang.
- `repeat-x`
  - : Xếp hình ảnh theo chiều ngang nhưng không xếp theo chiều dọc.
- `repeat-y`
  - : Xếp hình ảnh theo chiều dọc nhưng không xếp theo chiều ngang.
- `no-repeat`
  - : Không xếp hình ảnh. Nó chỉ được sử dụng một lần.

Chúng tôi sử dụng phương pháp này để tạo đối tượng {{domxref("CanvasPattern")}} rất giống với các phương pháp chuyển màu mà chúng tôi đã thấy ở trên. Sau khi tạo mẫu, chúng ta có thể gán mẫu đó cho thuộc tính `fillStyle` hoặc `strokeStyle`. Ví dụ:

```js
const img = new Image();
img.src = "some-image.png";
const pattern = ctx.createPattern(img, "repeat");
```

> [!NOTE]
> Giống như phương pháp `drawImage()`, bạn phải đảm bảo hình ảnh bạn sử dụng đã được tải trước khi gọi phương thức này, nếu không mẫu có thể được vẽ không chính xác.

### Ví dụ về `createPattern`

Trong ví dụ cuối cùng này, chúng tôi sẽ tạo một mẫu để gán cho thuộc tính `fillStyle`. Điều duy nhất đáng chú ý là việc sử dụng trình xử lý `onload` của hình ảnh. Điều này nhằm đảm bảo hình ảnh được tải trước khi được gán cho mẫu.

```js
function draw() {
  const ctx = document.getElementById("canvas").getContext("2d");

  // create new image object to use as pattern
  const img = new Image();
  img.src = "canvas_create_pattern.png";
  img.onload = () => {
    // create pattern
    const pattern = ctx.createPattern(img, "repeat");
    ctx.fillStyle = pattern;
    ctx.fillRect(0, 0, 150, 150);
  };
}
```

```html hidden
<canvas id="canvas" width="150" height="150" role="presentation"></canvas>
```

```js hidden
draw();
```

{{EmbedLiveSample("A_createPattern_example", "", "160")}}

## Bóng tối

Việc sử dụng bóng chỉ bao gồm bốn thuộc tính:

- {{domxref("CanvasRenderingContext2D.shadowOffsetX", "shadowOffsetX = float")}}
  - : Cho biết khoảng cách theo chiều ngang mà bóng sẽ kéo dài từ đối tượng. Giá trị này không bị ảnh hưởng bởi ma trận chuyển đổi. Mặc định là 0.
- {{domxref("CanvasRenderingContext2D.shadowOffsetY", "shadowOffsetY = float")}}
  - : Cho biết khoảng cách theo chiều dọc mà bóng sẽ kéo dài từ vật thể. Giá trị này không bị ảnh hưởng bởi ma trận chuyển đổi. Mặc định là 0.
- {{domxref("CanvasRenderingContext2D.shadowBlur", "shadowBlur = float")}}
  - : Cho biết kích thước của hiệu ứng làm mờ; giá trị này không tương ứng với một số pixel và không bị ảnh hưởng bởi ma trận chuyển đổi hiện tại. Giá trị mặc định là 0.
- {{domxref("CanvasRenderingContext2D.shadowColor", "shadowColor = color")}}
  - : Giá trị màu CSS tiêu chuẩn biểu thị màu của hiệu ứng đổ bóng; theo mặc định, nó có màu đen hoàn toàn trong suốt.

Các thuộc tính `shadowOffsetX` và `shadowOffsetY` cho biết bóng sẽ kéo dài bao xa so với đối tượng theo hướng X và Y; những giá trị này không bị ảnh hưởng bởi ma trận biến đổi hiện tại. Sử dụng các giá trị âm để làm cho bóng kéo dài lên hoặc sang trái và các giá trị dương để làm cho bóng kéo dài xuống hoặc sang phải. Cả hai đều là 0 theo mặc định.

Thuộc tính `shadowBlur` cho biết kích thước của hiệu ứng làm mờ; giá trị này không tương ứng với một số pixel và không bị ảnh hưởng bởi ma trận chuyển đổi hiện tại. Giá trị mặc định là 0.

Thuộc tính `shadowColor` là giá trị màu CSS tiêu chuẩn cho biết màu của hiệu ứng đổ bóng; theo mặc định, nó có màu đen hoàn toàn trong suốt.

> [!NOTE]
> Bóng chỉ được vẽ cho `source-over` [các hoạt động tổng hợp](/en-US/docs/Web/API/Canvas_API/Tutorial/Compositing).

### Ví dụ về văn bản bị đổ bóng

Ví dụ này vẽ một chuỗi văn bản có hiệu ứng đổ bóng.

```js
function draw() {
  const ctx = document.getElementById("canvas").getContext("2d");

  ctx.shadowOffsetX = 2;
  ctx.shadowOffsetY = 2;
  ctx.shadowBlur = 2;
  ctx.shadowColor = "rgb(0 0 0 / 50%)";

  ctx.font = "20px Times New Roman";
  ctx.fillStyle = "Black";
  ctx.fillText("Sample String", 5, 30);
}
```

```html hidden
<canvas id="canvas" width="150" height="80" role="presentation"></canvas>
```

```js hidden
draw();
```

{{EmbedLiveSample("A_shadowed_text_example")}}

Chúng ta sẽ xem xét thuộc tính `font` và phương pháp `fillText` trong chương tiếp theo về [vẽ văn bản](/en-US/docs/Web/API/Canvas_API/Tutorial/Drawing_text).

## Quy tắc điền canvas

Khi sử dụng `fill` (hoặc {{domxref("CanvasRenderingContext2D.clip", "clip")}} và {{domxref("CanvasRenderingContext2D.isPointInPath", "isPointInPath")}}), bạn có thể tùy ý cung cấp thuật toán quy tắc điền để xác định xem một điểm nằm trong hay ngoài đường dẫn và do đó liệu nó có được lấp đầy hay không. Điều này rất hữu ích khi một đường dẫn giao nhau hoặc được lồng vào nhau.

Có thể có hai giá trị:

- `nonzero`
  - : [Quy tắc cuộn dây khác 0](https://en.wikipedia.org/wiki/Nonzero-rule), là quy tắc mặc định.
- `evenodd`
  - : [Quy tắc cuộn dây chẵn-lẻ](https://en.wikipedia.org/wiki/Even%E2%80%93odd_rule).

Trong ví dụ này, chúng tôi đang sử dụng quy tắc `evenodd`.

```js
function draw() {
  const ctx = document.getElementById("canvas").getContext("2d");
  ctx.beginPath();
  ctx.arc(50, 50, 30, 0, Math.PI * 2, true);
  ctx.arc(50, 50, 15, 0, Math.PI * 2, true);
  ctx.fill("evenodd");
}
```

```html hidden
<canvas id="canvas" width="100" height="100" role="presentation"></canvas>
```

```js hidden
draw();
```

{{EmbedLiveSample("Canvas_fill_rules")}}

{{PreviousNext("Web/API/Canvas_API/Tutorial/Drawing_shapes", "Web/API/Canvas_API/Tutorial/Drawing_text")}}
