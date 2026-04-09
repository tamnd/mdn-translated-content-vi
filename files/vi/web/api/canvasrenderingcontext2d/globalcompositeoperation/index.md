---
title: "CanvasRenderingContext2D: thuộc tính GlobalCompositeOperation"
short-title: toàn cầuCompositeOperation
slug: Web/API/CanvasRenderingContext2D/globalCompositeOperation
page-type: web-api-instance-property
browser-compat: api.CanvasRenderingContext2D.globalCompositeOperation
---

{{APIRef("Canvas API")}}

Thuộc tính **`CanvasRenderingContext2D.globalCompositeOperation`** của API Canvas 2D đặt loại thao tác tổng hợp sẽ áp dụng khi vẽ các hình dạng mới.

Xem thêm [Compositing and clipping](/en-US/docs/Web/API/Canvas_API/Tutorial/Compositing) trong [Canvas Tutorial](/en-US/docs/Web/API/Canvas_API/Tutorial).

## Giá trị

Một chuỗi xác định thao tác nào trong chế độ tổng hợp hoặc chế độ hòa trộn sẽ sử dụng. Đây có thể là bất kỳ giá trị nào sau đây:

- `"source-over"`
- : Đây là cài đặt mặc định và vẽ các hình dạng mới lên trên nội dung canvas hiện có.
- `"source-in"`
- : Hình dạng mới chỉ được vẽ khi cả hình dạng mới và khung vẽ đích chồng lên nhau. Mọi thứ khác đều được minh bạch.
- `"source-out"`
- : Hình dạng mới được vẽ ở nơi nó không chồng lên nội dung canvas hiện có.
- `"source-atop"`
- : Hình dạng mới chỉ được vẽ ở nơi nó chồng lên nội dung canvas hiện có.
- `"destination-over"`
- : Các hình dạng mới được vẽ phía sau nội dung canvas hiện có.
- `"destination-in"`
- : Nội dung canvas hiện có được lưu giữ ở nơi cả hình dạng mới và nội dung canvas hiện có chồng lên nhau. Mọi thứ khác đều được minh bạch.
- `"destination-out"`
- : Nội dung hiện có được giữ ở nơi nó không chồng lên hình dạng mới.
- `"destination-atop"`
- : Canvas hiện có chỉ được giữ ở nơi nó chồng lên hình dạng mới. Hình dạng mới được vẽ phía sau nội dung canvas.
- `"lighter"`
- : Khi cả hai hình chồng lên nhau, màu được xác định bằng cách cộng các giá trị màu.
- `"copy"`
- : Chỉ có hình dạng mới được hiển thị.
- `"xor"`
- : Các hình dạng được làm trong suốt trong đó cả hai đều chồng lên nhau và được vẽ bình thường ở mọi nơi khác.
- `"multiply"`
- : Các pixel của lớp trên cùng được nhân với các pixel tương ứng của lớp dưới cùng. Kết quả là một hình ảnh tối hơn.
- `"screen"`
- : Các pixel được đảo ngược, nhân lên và đảo ngược lại. Kết quả là hình ảnh sáng hơn (ngược lại với `multiply`)
- `"overlay"`
- : Sự kết hợp của `multiply`và`screen`. Phần tối ở lớp nền trở nên tối hơn và phần sáng trở nên nhạt hơn.
- `"darken"`
- : Giữ lại các pixel tối nhất của cả hai lớp.
- `"lighten"`
- : Giữ lại các pixel nhẹ nhất của cả hai lớp.
- `"color-dodge"`
- : Chia lớp dưới cùng cho lớp trên cùng đảo ngược.
- `"color-burn"`
- : Chia lớp dưới cùng đảo ngược cho lớp trên cùng và sau đó đảo ngược kết quả.
- `"hard-light"`
- : Giống như `overlay`, sự kết hợp của`multiply`và`screen`— nhưng thay vào đó, lớp trên cùng và lớp dưới cùng được hoán đổi.
- `"soft-light"`
- : Một phiên bản nhẹ nhàng hơn của `hard-light`. Màu đen hoặc trắng thuần túy không tạo ra màu đen hoặc trắng thuần túy.
- `"difference"`
- : Trừ lớp dưới cùng khỏi lớp trên cùng - hoặc ngược lại - để luôn nhận được giá trị dương.
- `"exclusion"`
- : Giống như `difference` nhưng có độ tương phản thấp hơn.
- `"hue"`
- : Bảo toàn độ sáng và sắc độ của lớp dưới cùng, đồng thời sử dụng màu sắc của lớp trên cùng.
- `"saturation"`
- : Bảo toàn độ sáng và màu sắc của lớp dưới cùng, đồng thời sử dụng sắc độ của lớp trên cùng.
- `"color"`
- : Bảo toàn độ sáng của lớp dưới cùng, đồng thời sử dụng màu sắc và sắc độ của lớp trên cùng.
- `"luminosity"`
- : Giữ nguyên màu sắc và sắc độ của lớp dưới cùng, đồng thời sử dụng độ sáng của lớp trên cùng.

## Ví dụ

### Thay đổi hoạt động tổng hợp

Ví dụ này sử dụng thuộc tính `globalCompositeOperation` để vẽ hai hình chữ nhật tự loại trừ chúng ở những nơi chúng chồng lên nhau.

#### HTML

```html
<canvas id="canvas"></canvas>
```

#### JavaScript

```js
const canvas = document.getElementById("canvas");
const ctx = canvas.getContext("2d");

ctx.globalCompositeOperation = "xor";

ctx.fillStyle = "blue";
ctx.fillRect(10, 10, 100, 100);

ctx.fillStyle = "red";
ctx.fillRect(50, 50, 100, 100);
```

#### Kết quả

{{ EmbedLiveSample('Changing_the_composite_operation', 700, 180) }}

### Trình diễn tất cả các giá trị

#### Giá trị toàn cầu

Mã này thiết lập các giá trị chung được sử dụng bởi phần còn lại của chương trình.

```js
const canvas1 = document.createElement("canvas");
const canvas2 = document.createElement("canvas");
const gco = [
  "source-over",
  "source-in",
  "source-out",
  "source-atop",
  "destination-over",
  "destination-in",
  "destination-out",
  "destination-atop",
  "lighter",
  "copy",
  "xor",
  "multiply",
  "screen",
  "overlay",
  "darken",
  "lighten",
  "color-dodge",
  "color-burn",
  "hard-light",
  "soft-light",
  "difference",
  "exclusion",
  "hue",
  "saturation",
  "color",
  "luminosity",
].reverse();
const gcoText = [
  "This is the default setting and draws new shapes on top of the existing canvas content.",
  "The new shape is drawn only where both the new shape and the destination canvas overlap. Everything else is made transparent.",
  "The new shape is drawn where it doesn't overlap the existing canvas content.",
  "The new shape is only drawn where it overlaps the existing canvas content.",
  "New shapes are drawn behind the existing canvas content.",
  "The existing canvas content is kept where both the new shape and existing canvas content overlap. Everything else is made transparent.",
  "The existing content is kept where it doesn't overlap the new shape.",
  "The existing canvas is only kept where it overlaps the new shape. The new shape is drawn behind the canvas content.",
  "Where both shapes overlap the color is determined by adding color values.",
  "Only the new shape is shown.",
  "Shapes are made transparent where both overlap and drawn normal everywhere else.",
  "The pixels of the top layer are multiplied with the corresponding pixel of the bottom layer. A darker picture is the result.",
  "The pixels are inverted, multiplied, and inverted again. A lighter picture is the result (opposite of multiply)",
  "A combination of multiply and screen. Dark parts on the base layer become darker, and light parts become lighter.",
  "Retains the darkest pixels of both layers.",
  "Retains the lightest pixels of both layers.",
  "Divides the bottom layer by the inverted top layer.",
  "Divides the inverted bottom layer by the top layer, and then inverts the result.",
  "A combination of multiply and screen like overlay, but with top and bottom layer swapped.",
  "A softer version of hard-light. Pure black or white does not result in pure black or white.",
  "Subtracts the bottom layer from the top layer or the other way round to always get a positive value.",
  "Like difference, but with lower contrast.",
  "Preserves the luma and chroma of the bottom layer, while adopting the hue of the top layer.",
  "Preserves the luma and hue of the bottom layer, while adopting the chroma of the top layer.",
  "Preserves the luma of the bottom layer, while adopting the hue and chroma of the top layer.",
  "Preserves the hue and chroma of the bottom layer, while adopting the luma of the top layer.",
].reverse();
const width = 320;
const height = 340;

// lum in sRGB
const lum = {
  r: 0.33,
  g: 0.33,
  b: 0.33,
};
// resize canvas
canvas1.width = width;
canvas1.height = height;
canvas2.width = width;
canvas2.height = height;
```

#### Chương trình chính

Mã này,`runComposite()`, xử lý phần lớn công việc, dựa vào một số chức năng tiện ích để thực hiện các phần cứng.

```js
function createCanvas(op) {
  const canvas = document.createElement("canvas");
  canvas.style.background = `url(${JSON.stringify(op.data)})`;
  canvas.style.border = "1px solid black";
  canvas.style.margin = "5px";
  canvas.width = width / 2;
  canvas.height = height / 2;
  return canvas;
}

function runComposite(op) {
  const dl = document.createElement("dl");
  document.body.appendChild(dl);
  while (gco.length) {
    const pop = gco.pop();
    const dt = document.createElement("dt");
    dt.textContent = pop;
    dl.appendChild(dt);
    const dd = document.createElement("dd");
    const p = document.createElement("p");
    p.textContent = gcoText.pop();
    dd.appendChild(p);

    const canvasToDrawOn = createCanvas(op);
    const canvasToDrawFrom = createCanvas(op);
    const canvasToDrawResult = createCanvas(op);

    let ctx = canvasToDrawResult.getContext("2d");
    ctx.clearRect(0, 0, width, height);
    ctx.save();
    ctx.drawImage(canvas1, 0, 0, width / 2, height / 2);
    ctx.globalCompositeOperation = pop;
    ctx.drawImage(canvas2, 0, 0, width / 2, height / 2);
    ctx.globalCompositeOperation = "source-over";
    ctx.fillStyle = "rgb(0 0 0 / 80%)";
    ctx.fillRect(0, height / 2 - 20, width / 2, 20);
    ctx.fillStyle = "white";
    ctx.font = "14px arial";
    ctx.fillText(pop, 5, height / 2 - 5);
    ctx.restore();

    ctx = canvasToDrawOn.getContext("2d");
    ctx.clearRect(0, 0, width, height);
    ctx.save();
    ctx.drawImage(canvas1, 0, 0, width / 2, height / 2);
    ctx.fillStyle = "rgb(0 0 0 / 80%)";
    ctx.fillRect(0, height / 2 - 20, width / 2, 20);
    ctx.fillStyle = "white";
    ctx.font = "14px arial";
    ctx.fillText("existing content", 5, height / 2 - 5);
    ctx.restore();

    ctx = canvasToDrawFrom.getContext("2d");
    ctx.clearRect(0, 0, width, height);
    ctx.save();
    ctx.drawImage(canvas2, 0, 0, width / 2, height / 2);
    ctx.fillStyle = "rgb(0 0 0 / 80%)";
    ctx.fillRect(0, height / 2 - 20, width / 2, 20);
    ctx.fillStyle = "white";
    ctx.font = "14px arial";
    ctx.fillText("new content", 5, height / 2 - 5);
    ctx.restore();

    dd.appendChild(canvasToDrawOn);
    dd.appendChild(canvasToDrawFrom);
    dd.appendChild(canvasToDrawResult);

    dl.appendChild(dd);
  }
}
```

#### Chức năng tiện ích

Chương trình dựa trên một số chức năng tiện ích.

```js
function lightMix() {
  const ctx = canvas2.getContext("2d");
  ctx.save();
  ctx.globalCompositeOperation = "lighter";
  ctx.beginPath();
  ctx.fillStyle = "red";
  ctx.arc(100, 200, 100, Math.PI * 2, 0, false);
  ctx.fill();
  ctx.beginPath();
  ctx.fillStyle = "blue";
  ctx.arc(220, 200, 100, Math.PI * 2, 0, false);
  ctx.fill();
  ctx.beginPath();
  ctx.fillStyle = "lime";
  ctx.arc(160, 100, 100, Math.PI * 2, 0, false);
  ctx.fill();
  ctx.restore();
  ctx.beginPath();
  ctx.fillStyle = "red";
  ctx.fillRect(0, 0, 30, 30);
  ctx.fill();
}
```

```js
function colorSphere() {
  const ctx = canvas1.getContext("2d");
  const width = 360;
  const halfWidth = width / 2;
  const rotate = (1 / 360) * Math.PI * 2; // per degree
  const offset = 0; // scrollbar offset
  const oLeft = -20;
  const oTop = -20;
  for (let n = 0; n <= 359; n++) {
    const gradient = ctx.createLinearGradient(
      oLeft + halfWidth,
      oTop,
      oLeft + halfWidth,
      oTop + halfWidth,
    );
    const color = Color.HSV_RGB({ H: (n + 300) % 360, S: 100, V: 100 });
    gradient.addColorStop(0, "transparent");
    gradient.addColorStop(0.7, `rgb(${color.R} ${color.G} ${color.B})`);
    gradient.addColorStop(1, "white");
    ctx.beginPath();
    ctx.moveTo(oLeft + halfWidth, oTop);
    ctx.lineTo(oLeft + halfWidth, oTop + halfWidth);
    ctx.lineTo(oLeft + halfWidth + 6, oTop);
    ctx.fillStyle = gradient;
    ctx.fill();
    ctx.translate(oLeft + halfWidth, oTop + halfWidth);
    ctx.rotate(rotate);
    ctx.translate(-(oLeft + halfWidth), -(oTop + halfWidth));
  }
  ctx.beginPath();
  ctx.fillStyle = "blue";
  ctx.fillRect(15, 15, 30, 30);
  ctx.fill();
  return ctx.canvas;
}
```

```js
// HSV (1978) = H: Hue / S: Saturation / V: Value
Color = {};
Color.HSV_RGB = (o) => {
  const S = o.S / 100;
  let H = o.H / 360,
    V = o.V / 100;
  let R, G;
  let A, B, C, D;
  if (S === 0) {
    R = G = B = Math.round(V * 255);
  } else {
    if (H >= 1) H = 0;
    H *= 6;
    D = H - Math.floor(H);
    A = Math.round(255 * V * (1 - S));
    B = Math.round(255 * V * (1 - S * D));
    C = Math.round(255 * V * (1 - S * (1 - D)));
    V = Math.round(255 * V);
    switch (Math.floor(H)) {
      case 0:
        R = V;
        G = C;
        B = A;
        break;
      case 1:
        R = B;
        G = V;
        B = A;
        break;
      case 2:
        R = A;
        G = V;
        B = C;
        break;
      case 3:
        R = A;
        G = B;
        B = V;
        break;
      case 4:
        R = C;
        G = A;
        B = V;
        break;
      case 5:
        R = V;
        G = A;
        // B remains unchanged
        break;
    }
  }
  return { R, G, B };
};

function createInterlace(size, color1, color2) {
  const proto = document.createElement("canvas").getContext("2d");
  proto.canvas.width = size * 2;
  proto.canvas.height = size * 2;
  proto.fillStyle = color1; // top-left
  proto.fillRect(0, 0, size, size);
  proto.fillStyle = color2; // top-right
  proto.fillRect(size, 0, size, size);
  proto.fillStyle = color2; // bottom-left
  proto.fillRect(0, size, size, size);
  proto.fillStyle = color1; // bottom-right
  proto.fillRect(size, size, size, size);
  const pattern = proto.createPattern(proto.canvas, "repeat");
  pattern.data = proto.canvas.toDataURL();
  return pattern;
}

const op8x8 = createInterlace(8, "white", "#eeeeee");
```

#### Bắt đầu chạy

Cuối cùng, chúng tôi gọi các hàm để thiết lập mọi thứ chuyển động.

```js
lightMix();
colorSphere();
runComposite(op8x8);
```

#### Kết quả

{{EmbedLiveSample("Demonstration of all values", "100%", 7250)}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Giao diện xác định thuộc tính này: {{domxref("CanvasRenderingContext2D")}}
- {{domxref("CanvasRenderingContext2D.globalAlpha")}}
