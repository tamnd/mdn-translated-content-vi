---
title: CSS color values
short-title: Color values
slug: Web/CSS/Guides/Colors/Color_values
page-type: guide
sidebar: cssref
---

Để biểu diễn màu sắc trong CSS, bạn cần tìm cách chuyển đổi khái niệm "màu sắc" theo nghĩa thông thường sang dạng kỹ thuật số mà máy tính có thể xử lý. Điều này thường được thực hiện bằng cách phân tách màu sắc thành các thành phần, chẳng hạn như lượng của các màu cơ bản khác nhau để pha trộn với nhau, hoặc độ sáng và sắc độ. Các mô hình màu được định nghĩa chuẩn đảm bảo rằng màu sắc sẽ hiển thị giống nhau bất kể chúng được kết xuất ở đâu.

Mô hình màu là mô hình toán học biểu diễn màu sắc bằng các giá trị số. Các mô hình màu mô tả cách tạo ra các màu sắc có sẵn trong một không gian màu. {{glossary("RGB")}} là mô hình màu đầu tiên trên web. Không gian màu `sRGB` của mô hình màu RGB — không gian màu red (đỏ), green (lục), blue (lam) tiêu chuẩn — được tạo ra vào năm 1996 cho màn hình máy tính và web. {{glossary("color space", "Không gian màu")}} là một hệ thống phân nhóm màu sắc sao cho việc mô tả bất kỳ màu nào đều nhất quán. Nếu bạn chuyển đổi một màu giữa hai không gian màu khác nhau, nó sẽ trông giống nhau ở cả hai.

Ban đầu, màn hình bị giới hạn về số lượng màu sắc có thể hiển thị, và màu sắc CSS cũng bị giới hạn bởi những ràng buộc đó, được mở rộng dần khi khả năng cải thiện. Với các thiết bị hiện đại không còn bị giới hạn bởi RGB, chúng ta hiện có thêm các mô hình màu dựa trên nhận thức của con người, cung cấp {{glossary("gamut", "dải màu")}} rộng hơn nhiều. Chúng ta giờ có thể mô tả màu sắc trong CSS theo nhiều cách, và các tùy chọn ngày càng được mở rộng.

Hướng dẫn này giới thiệu các kiểu giá trị {{cssxref("&lt;color&gt;")}} khác nhau. Để tìm hiểu chi tiết hơn, hãy xem các liên kết tham chiếu được cung cấp bên dưới.

## Keywords

Web định nghĩa một tập hợp các tên màu tiêu chuẩn cho phép bạn dùng keyword thay vì biểu diễn số để mô tả màu sắc. Đây là cách tiếp cận đơn giản hơn nhưng có giới hạn hơn — có thể không có keyword nào biểu diễn chính xác màu bạn muốn dùng.

Các color keyword bao gồm các màu cơ bản và màu thứ cấp tiêu chuẩn (chẳng hạn như `red`, `blue`, hoặc `orange`), các sắc thái xám (từ `black` đến `white`, bao gồm các màu như `darkgray` và `lightgrey`), và một loạt các màu pha trộn khác, bao gồm `lightseagreen`, `cornflowerblue`, và `rebeccapurple`. Các màu có tên sử dụng mô hình [RGB](/en-US/docs/Glossary/RGB) và được liên kết với không gian màu sRGB (`srgb`).

Có hơn 160 màu có tên. Có những màu có tên đặc biệt đáng chú ý: [`transparent`](/en-US/docs/Web/CSS/Reference/Values/named-color#transparent) đặt giá trị màu trong suốt, còn [`currentColor`](/en-US/docs/Web/CSS/Reference/Values/color_value#currentcolor_keyword) lấy giá trị hiện tại của thuộc tính CSS {{cssxref("color")}}. Ngoài ra còn có các màu {{cssxref("system-color")}} có tên như `accentcolortext` và `buttonface`, phản ánh các lựa chọn màu mặc định của người dùng, trình duyệt, hoặc hệ điều hành.

Tất cả color keyword đều không phân biệt chữ hoa chữ thường. Xem kiểu dữ liệu {{cssxref("named-color")}} để biết thêm thông tin về color keyword.

## Giá trị RGB

Có hai cách chính để định nghĩa màu {{glossary("RGB")}} theo các thành phần đỏ, lục, lam trong CSS — ký hiệu hexadecimal và giá trị `rgb()`. Giống như màu có tên, các phương pháp này sử dụng mô hình [RGB](/en-US/docs/Glossary/RGB) và được liên kết với không gian màu sRGB (`srgb`). Tuy nhiên, chúng cho phép chỉ định một phạm vi màu rộng hơn nhiều.

### Ký hiệu chuỗi hexadecimal

Ký hiệu chuỗi hexadecimal (hex) sử dụng giá trị hexadecimal để biểu diễn từng thành phần (đỏ, lục, và lam) của một màu RGB. Nó cũng có thể bao gồm thành phần thứ tư: kênh alpha (hay độ mờ đục).

Màu theo ký hiệu chuỗi hexadecimal luôn bắt đầu bằng ký tự `"#"`. Theo sau đó là các chữ số hexadecimal của mã màu. Chuỗi không phân biệt chữ hoa chữ thường.

- `"#rrggbb"`
  - : Chỉ định màu hoàn toàn mờ đục có thành phần đỏ là số hexadecimal `0xrr`, thành phần lục là `0xgg`, và thành phần lam là `0xbb`.

- `"#rrggbbaa"`
  - : Chỉ định màu có thành phần đỏ là số hexadecimal `0xrr`, thành phần lục là `0xgg`, và thành phần lam là `0xbb`. Kênh alpha được chỉ định bởi `0xaa`; giá trị này càng thấp, màu càng trong suốt.

- `"#rgb"`
  - : Chỉ định màu có thành phần đỏ là số hexadecimal `0xrr`, thành phần lục là `0xgg`, và thành phần lam là `0xbb`.

- `"#rgba"`
  - : Chỉ định màu có thành phần đỏ là số hexadecimal `0xrr`, thành phần lục là `0xgg`, và thành phần lam là `0xbb`. Kênh alpha được chỉ định bởi `0xaa`; giá trị này càng thấp, màu càng trong suốt.

Như đã trình bày ở trên, các thành phần màu đỏ, lục, và lam đều có thể được biểu diễn dưới dạng giá trị hex hai chữ số đại diện cho số từ 0 (`00`) đến 255 (`FF`) hoặc giá trị hex một chữ số (số từ 0 (`0`) đến 15 (`F`).

> [!NOTE]
> Tiền tố `0x` trong các giá trị trên chỉ ra một số nguyên theo hệ hexadecimal. Số nguyên hexadecimal có thể bao gồm các chữ số (`0` - `9`) và các chữ cái `a` – `f` và `A` – `F`. Chữ hoa hay chữ thường không làm thay đổi giá trị. Do đó: `0xa` = `0xA` = `10` và `0xf` = `0xF` = `15`.

Hai màu hex này là các giá trị màu tương đương nhau; cả hai đều là màu đỏ:

```css
color: #ff0000;
color: #f00;
```

Tất cả các thành phần _phải_ được chỉ định bằng cùng số chữ số. Nếu bạn dùng ký hiệu một chữ số, màu cuối cùng được tính bằng cách dùng chữ số của mỗi thành phần hai lần; tức là `"#D"` trở thành `"#DD"` khi vẽ.

Để làm cho các giá trị mờ đục 25%, hãy thêm giá trị kênh alpha như sau:

```css
color: #ff000044;
color: #f004;
```

Xem kiểu dữ liệu {{cssxref("hex-color")}} để biết thêm thông tin về ký hiệu chuỗi hexadecimal cho màu sắc.

#### Kiểu nhập màu HTML

Có nhiều tình huống trong đó trang web của bạn có thể cần để người dùng chọn màu. Có thể bạn có giao diện người dùng có thể tùy chỉnh, hoặc bạn đang triển khai ứng dụng vẽ. Có thể bạn có văn bản có thể chỉnh sửa và cần để người dùng chọn màu chữ. Hoặc có thể ứng dụng của bạn cho phép người dùng gán màu cho các thư mục hoặc mục. Cho các trường hợp sử dụng như vậy, phần tử {{HTMLElement("input")}} có `"color"` [`type`](/en-US/docs/Web/HTML/Reference/Elements/input#type), hiển thị điều khiển color picker.

Ví dụ này cho phép bạn chọn màu. Sau khi chọn, {{cssxref("border-color")}} được đặt thành màu đó, và giá trị được hiển thị.

```html
<div id="box">
  <label for="colorPicker">Border color:</label>
  <input type="color" value="#8888ff" id="colorPicker" />
  <output></output>
</div>
```

HTML tạo ra một hộp chứa điều khiển color picker (với nhãn được tạo bằng phần tử {{HTMLElement("label")}}) và một phần tử {{HTMLElement("output")}} trống, nơi chúng ta sẽ xuất giá trị màu bằng JavaScript. Giá trị của input màu luôn là chuỗi hexadecimal.

{{EmbedLiveSample("HTML color input type", 525, 120)}}

```css hidden
#box {
  width: 500px;
  height: 100px;
  border: 5px solid rgb(245 220 225);
  padding: 4px 6px;
  font:
    16px "Lucida Grande",
    "Helvetica",
    "Arial",
    sans-serif;
}
```

JavaScript sau đây cập nhật màu của viền để khớp với giá trị ban đầu của color picker, sau đó thêm hai event handler vào phần tử [`<input type="color">`](/en-US/docs/Web/HTML/Reference/Elements/input/color) để phản hồi các thay đổi giá trị của nó.

```js
const colorPicker = document.querySelector("#colorPicker");
const box = document.querySelector("#box");
const output = document.querySelector("output");

box.style.borderColor = colorPicker.value;

colorPicker.addEventListener("input", (event) => {
  box.style.borderColor = event.target.value;
});

colorPicker.addEventListener("change", (event) => {
  output.innerText = `${colorPicker.value}`;
});
```

Sự kiện {{domxref("Element/input_event", "input")}} được gửi mỗi khi giá trị của phần tử thay đổi; tức là mỗi khi người dùng điều chỉnh màu trong color picker. Mỗi khi sự kiện này xảy ra, chúng ta đặt màu viền của hộp để khớp với giá trị hiện tại của color picker.

Sự kiện {{domxref("HTMLElement/change_event", "change")}} được nhận khi giá trị của color picker được hoàn tất. Chúng ta phản hồi bằng cách đặt nội dung của `<output>` thành giá trị chuỗi của màu được chọn.

### Ký hiệu hàm RGB

Ký hiệu hàm RGB (Red/Green/Blue), giống như ký hiệu chuỗi hexadecimal, biểu diễn màu sắc bằng các thành phần đỏ, lục, và lam (và, tùy chọn, một thành phần kênh alpha cho độ trong suốt). Tuy nhiên, thay vì sử dụng chuỗi, màu được định nghĩa bằng hàm CSS {{cssxref("color_value/rgb", "rgb()")}}. Hàm này nhận 3 hoặc 4 tham số đầu vào — giá trị thành phần đỏ, lục, lam và giá trị kênh alpha tùy chọn.

Các giá trị hợp lệ cho mỗi tham số là:

- `red`, `green`, và `blue`
  - : Mỗi tham số phải là giá trị {{cssxref("&lt;number&gt;")}} từ 0 đến 255 (bao gồm), giá trị {{cssxref("&lt;percentage&gt;")}} từ 0% đến 100%, hoặc keyword `none`, tương đương với `0` trong trường hợp này.

- `alpha`
  - : Kênh alpha được chỉ định là phần trăm từ `0%` (hoàn toàn trong suốt) đến `100%` (hoàn toàn mờ đục), hoặc số từ `0.0` (tương đương `0%`) đến `1.0` (tương đương `100%`).

Ví dụ, màu đỏ tươi với độ mờ đục 50% có thể được biểu diễn là `rgb(255 0 0 / 50%)` hoặc `rgb(100% 0 0 / 0.5)`.

Xem hàm màu {{cssxref("color_value/rgb", "rgb()")}} để biết thêm thông tin về ký hiệu hàm RGB.

## Hàm màu với thành phần hue

Các hàm màu có thành phần {{cssxref("hue")}} — một {{cssxref("angle")}} trên {{glossary("color wheel", "bánh xe màu")}} của mô hình màu đó — bao gồm các hàm màu sRGB `hsl()` và `hwb()`, hàm `lch()` của CIElab, và hàm màu `oklch()` của OKLab. Các hàm màu này trực quan hơn vì hue cho phép chúng ta nhận biết sự khác biệt hay tương đồng giữa các màu như đỏ, cam, vàng, lục, lam, v.v.

### Ký hiệu hàm HSL

Hàm màu CSS `hsl()` là hàm màu dựa trên hue đầu tiên được hỗ trợ trong các trình duyệt. `hsl()` trực quan hơn `rgb()` — thông thường dễ dàng hơn để xác định hiệu ứng của việc thay đổi giá trị hue (`h`), saturation (`s`), và lightness (`l`) so với việc khai báo màu cụ thể qua các giá trị kênh đỏ, lục, và lam. Ngoài ra, HSL tương tự như color picker HSB (hue, saturation, và brightness) trong Photoshop, khiến nó quen thuộc ngay lập tức với nhiều người khi được hỗ trợ lần đầu.

Cả hai hàm màu sRGB `hsl()` và `hwb()` đều là hình trụ. Hue định nghĩa màu sắc như một {{cssxref("angle")}} trên {{glossary("color wheel", "bánh xe màu")}} hình tròn. Sơ đồ dưới đây cho thấy hình trụ màu HSL. Saturation là phần trăm xác định màu nằm ở đâu trên thang đo từ hoàn toàn xám đến có lượng hue tối đa có thể.
Khi giá trị lightness tăng, màu chuyển từ tối nhất đến sáng nhất có thể (từ đen đến trắng).

![Hình trụ màu HSL](640px-hsl_color_solid_cylinder.png)

Hình ảnh được cung cấp bởi người dùng [SharkD](https://commons.wikimedia.org/wiki/User:SharkD) trên [Wikipedia](https://en.wikipedia.org/), được phân phối theo giấy phép [CC BY-SA 3.0](https://creativecommons.org/licenses/by-sa/3.0/).

Giá trị của thành phần hue (`H`) của màu HSL (hoặc HWB) là góc bắt đầu tại 0° là màu đỏ, sau đó chuyển qua vàng, lục, lam lục, lam, và tím đỏ, trước khi quay lại màu đỏ ở 360°. Giá trị có thể được chỉ định theo bất kỳ đơn vị {{cssxref("angle")}} nào được CSS hỗ trợ, bao gồm độ (`deg`), radian (`rad`), gradian (`grad`), hoặc vòng (`turn`). Giá trị hue xác định sắc màu cơ bản là gì, nhưng không kiểm soát màu có rực rỡ hay nhạt, hay sáng hay tối như thế nào.

Thành phần saturation (`S`) của màu chỉ định phần trăm của màu cuối cùng được tạo thành từ hue được chỉ định, với 100% là bão hòa hoàn toàn và 0% là hoàn toàn không có màu (thang xám). Thành phần lightness (`L`) chỉ định màu sáng như thế nào trên thang trượt từ hoàn toàn đen (`0%`) đến hoàn toàn trắng (`100%`). Bạn cũng có thể tùy chọn bao gồm kênh alpha, được đặt trước bởi dấu gạch chéo (`/`) để làm cho màu ít hơn 100% mờ đục.

Dưới đây là một số màu mẫu theo ký hiệu HSL:

```css hidden
table {
  border: 1px solid black;
  font:
    16px "Open Sans",
    "Helvetica",
    "Arial",
    sans-serif;
  border-spacing: 0;
  border-collapse: collapse;
}

th,
td {
  border: 1px solid black;
  padding: 4px 6px;
  text-align: left;
}

th {
  background-color: hsl(0 0% 75%);
}
```

```html hidden
<table>
  <thead>
    <tr>
      <th scope="col">Color in HSL notation</th>
      <th scope="col">Example</th>
    </tr>
  </thead>
  <tbody></tbody>
</table>
```

```js hidden
const colors = [
  "hsl(90deg 0% 50%)",
  "hsl(90 100% 50%)",
  "hsl(0.15turn 50% 75%)",
  "hsl(0.15turn 90% 75%)",
  "hsl(0.15turn 90% 50%)",
  "hsl(270deg 90% 50% / 50%)",
];

const tbody = document.querySelector("tbody");
for (const color of colors) {
  const tr = document.createElement("tr");
  const td1 = document.createElement("td");
  td1.appendChild(document.createElement("code")).textContent = color;
  const td2 = document.createElement("td");
  td2.style.backgroundColor = color;
  tr.appendChild(td1);
  tr.appendChild(td2);
  tbody.appendChild(tr);
}
```

{{EmbedLiveSample("HSL_functional_notation", 300, 200)}}

Giá trị cuối cùng là bán trong suốt; nó bao gồm giá trị alpha tùy chọn, đặt trước bởi dấu gạch chéo.

> [!NOTE]
> Khi bạn bỏ qua đơn vị của hue, nó được giả định là độ (`deg`).

### Ký hiệu hàm HWB

Hàm màu [`hwb()`](/en-US/docs/Web/CSS/Reference/Values/color_value/hwb) sử dụng cùng hệ tọa độ hue như `hsl()`, với `0deg` là màu đỏ. Tuy nhiên, thay vì lightness và saturation của `hsl()`, hàm `hwb()` chỉ định whiteness (`W`) và blackness (`B`). Hàm này cũng khá trực quan — cho phép bạn chọn hue và sau đó trộn vào các lượng trắng và/hoặc đen để đạt được màu mong muốn.

Giá trị `W` và `B` dao động từ `0%` đến `100%` (hoặc `0` đến `1`). Nếu tổng giá trị của `W` và `B` là 100% (hoặc `1`) hoặc lớn hơn, màu sẽ là xám, tương tự như đặt `s` thành `0%` với `hsl()`. Như với `hsl()`, một giá trị alpha tùy chọn có thể được bao gồm, đặt trước bởi dấu gạch chéo `/`.

Dưới đây là một số ví dụ sử dụng ký hiệu HWB:

```css
/* Các ví dụ này đều chỉ định các sắc thái khác nhau của màu lục chanh. */
hwb(90 10% 10%)
hwb(90 50% 10%)
hwb(90deg 10% 10%)
hwb(1.5708rad 60% 0%)
hwb(.25turn 0% 40%)

/* Màu lục chanh tương tự nhưng có giá trị alpha */
hwb(90 10% 10% / 0.5)
hwb(90 10% 10% / 50%)
```

Trong các ví dụ dưới đây, chúng ta đặt cùng các hue như trong các ví dụ `hsl()`, nhưng thêm whiteness và blackness vào mỗi hue qua `hwb()` thay vì saturation và lightness:

```css hidden live-sample___hwb_functional_notation
table {
  border: 1px solid black;
  font:
    16px "Open Sans",
    "Helvetica",
    "Arial",
    sans-serif;
  border-spacing: 0;
  border-collapse: collapse;
}

th,
td {
  border: 1px solid black;
  padding: 4px 6px;
  text-align: left;
}

th {
  background-color: hwb(0 75% 25%);
}
```

```html hidden live-sample___hwb_functional_notation
<table>
  <thead>
    <tr>
      <th scope="col">Color in HWB notation</th>
      <th scope="col">Example</th>
    </tr>
  </thead>
  <tbody></tbody>
</table>
```

```js hidden live-sample___hwb_functional_notation
const colors = [
  "hwb(90deg 50% 50%)",
  "hwb(90 0% 0%)",
  "hwb(0.15turn 25% 0%)",
  "hwb(0.15turn 10% 25%)",
  "hwb(1turn 10% 65%)",
  "hwb(270deg 75% 10%)",
];

const tbody = document.querySelector("tbody");
for (const color of colors) {
  const tr = document.createElement("tr");
  const td1 = document.createElement("td");
  td1.appendChild(document.createElement("code")).textContent = color;
  const td2 = document.createElement("td");
  td2.style.backgroundColor = color;
  tr.appendChild(td1);
  tr.appendChild(td2);
  tbody.appendChild(tr);
}
```

{{EmbedLiveSample("HWB_functional_notation", 300, 200)}}

### LCH và OkLCh: Không gian màu CIELAB và Oklab

Mặc dù `hsl()` và `hwb()` trực quan, chúng có một nhược điểm lớn. Với các hàm này, mọi góc hue bão hòa hoàn toàn (`hsl(<angle> 100% 50%)` hoặc `hwb(<angle> 0% 0%)`) đều có cùng lightness, nhưng đó không phải là cách thị giác con người hay màn hình hoạt động. Đặt chữ trắng trên màu lam bão hòa hoàn toàn (`hsl(240deg 100% 50%)`) có thể đọc được, nhưng cùng chữ đó trên màu vàng bão hòa hoàn toàn (`hsl(60deg 100% 50%)`) không chỉ không đọc được mà còn có thể làm tổn thương mắt người dùng. Trong các hàm màu này, lightness của màu là tương đối so với các màu khác, không phải theo nhận thức của con người. Trên thực tế, không phải tất cả các hue đều có cùng độ bão hòa tối đa.

Sẽ tuyệt vời không nếu bạn chỉ cần thay đổi kênh hue của màu trên trang web mà không làm cho văn bản không thể đọc được? Bạn có thể làm điều đó với các hàm màu trong không gian màu CIELAB và Oklab.

Không gian màu CIELAB và Oklab đại diện cho toàn bộ phạm vi màu sắc mà con người có thể nhìn thấy. Các hàm màu CIE Lab bao gồm [`lch()`](/en-US/docs/Web/CSS/Reference/Values/color_value/lch) và [`lab()`](/en-US/docs/Web/CSS/Reference/Values/color_value/lab). Các hàm màu Oklab bao gồm [`oklch()`](/en-US/docs/Web/CSS/Reference/Values/color_value/oklch) và [`oklab()`](/en-US/docs/Web/CSS/Reference/Values/color_value/oklab). Mục đích chính của các mô hình này là chúng đồng nhất, sao cho một khoảng cách nhất định giữa hai điểm bất kỳ trong không gian màu sẽ trông khác biệt đều nhau với người xem. Oklab là không gian màu sử dụng cùng loại mô hình như CIELAB nhưng được xây dựng bằng các bước tối ưu hóa số học bổ sung, vì vậy các giá trị được coi là chính xác hơn CIELAB. Do sự tối ưu hóa này, các hue đồng nhất hơn về mặt nhận thức.

Các hàm `lch()` và `oklch()` sử dụng lightness (`L`), chroma (`C`), và hue (`H`), và được thảo luận thêm trong phần này. Các hàm [`lab()` và `oklab()`](#lab_and_oklab) hoạt động khác nhau, sử dụng lightness (`L`), độ đỏ/xanh lục (dọc theo trục `a`), và độ vàng/xanh lam (dọc theo trục `b`). Các trục này được gọi là tọa độ chữ nhật. Lợi ích chính của các hàm màu này là "lightness" là lightness được nhận thức; đó là độ sáng của màu sắc được nhận thức bởi mắt người thay vì lightness so với các màu khác.

Tương tự như các hàm màu hue sRGB, giá trị hue (`h`) trong `lch()` và `oklch()` là số, góc, hoặc keyword `none` (tương đương với `0deg`) đại diện cho góc `<hue>` của màu. Tuy nhiên, màu sắc ở mỗi giá trị góc không giống nhau. Các góc tương ứng với các hue cụ thể khác nhau giữa không gian màu sRGB, CIELAB (được dùng bởi `lch()`), và Oklab (được dùng bởi `oklch()`).

Các gradient sau đây minh họa màu sắc hue ở mọi góc từ `0deg` đến `360deg` trong các không gian màu sRGB, CIE Lab, và OKlab:

```html hidden live-sample___hues
<p>sRGB (<code>hsl()</code> and <code>hwb()</code>)</p>
<div id="srgb"></div>
<p>CIE Lab (<code>lch()</code>)</p>
<div id="lch"></div>
<p>OKLab (<code>oklch()</code>)</p>
<div id="oklch"></div>
<p>
  <label><input type="checkbox" /> Toggle greyscale</label>
</p>
```

```css hidden live-sample___hues
div:has(~ p input:checked) {
  filter: grayscale(100%);
}
p {
  margin: 0;
}
div {
  height: 50px;
  margin-bottom: 10px;
}
#srgb {
  background: linear-gradient(
    to right,
    hsl(0deg 100% 50%),
    hsl(90deg 100% 50%),
    hsl(180deg 100% 50%),
    hsl(270deg 100% 50%),
    hsl(360deg 100% 50%)
  );
}
#lch {
  background: linear-gradient(
    to right,
    lch(50% 100% 0deg),
    lch(50% 100% 90deg),
    lch(50% 100% 180deg),
    lch(50% 100% 270deg),
    lch(50% 100% 360deg)
  );
}
#oklch {
  background: linear-gradient(
    to right,
    oklch(50% 100% 0deg),
    oklch(50% 100% 90deg),
    oklch(50% 100% 180deg),
    oklch(50% 100% 270deg),
    oklch(50% 100% 360deg)
  );
}
```

{{embedlivesample("hues", '100', '260') }}

Bạn có thể nhận thấy độ sáng của các gradient sau đồng đều hơn trên toàn phổ hue so với gradient sRGB. Chọn hộp kiểm trong ví dụ trên để chuyển đổi gradient hue sang thang xám để thấy rõ hơn điều này.

Cũng lưu ý cách phân bố giá trị lam trong CIE Lab rộng hơn so với hai gradient kia. Đây là sự khác biệt giữa `lch()` và `oklch()`. Phân bố lam của `lch()` do lỗi dịch chuyển chroma và lightness của giá trị hue giữa `270deg` và `330deg`. Điều này đã được giải quyết trong không gian màu oklab và do đó ký hiệu màu `oklch()`.

Như đã thảo luận ở trên, hue (`H`) trong `lch()` và `oklch()` là `<angle>`, `number` hoặc keyword `none`. `lightness` là {{cssxref("percentage")}} hoặc với `lch()` là số từ `0` đến `100` và với `oklch()` là số từ `0` đến `1`, với `0` hoặc `0%` là hoàn toàn không có lightness, tức là đen.

`C` là `<number>`, `<percentage>`, hoặc keyword `none` (tương đương với `0%`) là chroma của màu, hoặc "lượng màu". Điều này tương tự như giá trị saturation `S` của hàm màu `hsl()`. Giá trị `0` là hoàn toàn không có chroma hay saturation; kết quả là màu xám giữa trắng và đen (bao gồm), tùy thuộc vào giá trị lightness. Các giá trị số về lý thuyết không bị giới hạn, với `100%` tương đương với `150` cho `lch()` và `0.4` với `oklch()`.

Giống như các hàm màu khác, cũng có giá trị độ trong suốt alpha tùy chọn, đặt trước bởi dấu gạch chéo (`/`).

Ví dụ dưới đây cho thấy hiệu ứng của việc thay đổi giá trị lightness trong các hàm `lch()` và `oklch()`.

```css hidden live-sample___lch-colors
/* Varying shades of pink */
.container {
  display: grid;
  font-family: sans-serif;
  font-size: 14px;
  color: white;
  grid-template-columns: repeat(6, 1fr);
  gap: 4px;
}

.dark-text {
  color: lch(1% 40 0deg);
}

.container div {
  border-radius: 8px;
  padding: 8px 4px;
}
```

```html hidden live-sample___lch-colors
<div class="container"></div>
```

```js hidden live-sample___lch-colors
const container = document.querySelector(".container");
for (let l = 0; l <= 100; l += 10) {
  const div = document.createElement("div");
  const usedL = l === 0 ? 1 : l === 100 ? 99 : l;
  div.textContent = div.style.backgroundColor = `lch(${usedL}% 40 0)`;
  if (usedL >= 80) div.classList.add("dark-text");
  container.appendChild(div);
}
container.appendChild(document.createElement("div"));
for (let l = 0; l <= 100; l += 10) {
  const div = document.createElement("div");
  const usedL = l === 0 ? 1 : l === 100 ? 99 : l;
  div.textContent = div.style.backgroundColor = `oklch(${usedL}% 0.12 0)`;
  if (usedL >= 80) div.classList.add("dark-text");
  container.appendChild(div);
}
```

{{embedlivesample("lch-colors", '100', '200') }}

## Lab và OKLab

Ký hiệu hàm [`lab()`](/en-US/docs/Web/CSS/Reference/Values/color_value/lab) biểu diễn một màu nhất định trong không gian màu CIE L\*a\*b\*. Hàm [`oklab()`](/en-US/docs/Web/CSS/Reference/Values/color_value/oklab) định nghĩa màu sắc trong không gian màu OKLab. Các hàm này đại diện cho toàn bộ phạm vi màu sắc mà con người có thể nhìn thấy bằng cách chỉ định lightness (`L`), giá trị trục đỏ/lục (`a`), giá trị trục lam/vàng (`b`), và giá trị độ trong suốt alpha tùy chọn.

Tương tự như `lch()` và `oklch()`, `lightness` là:

- {{cssxref("percentage")}}, với `0%` là hoàn toàn đen và `100%` là hoàn toàn trắng.
- Số từ `0` đến `100` cho `lab()` và `0` đến `1` cho `oklab()`, trong đó `0` là hoàn toàn đen và `1`/`100` là hoàn toàn trắng.

Giá trị `a` là `<number>` từ `-125` đến `125` cho `lab()` hoặc `-0.4` đến `0.4` cho `oklab()`, `<percentage>` từ `-100%` đến `100%`, hoặc keyword `none` (tương đương với `0%` trong trường hợp này). Giá trị này chỉ định khoảng cách của màu dọc theo trục a trong không gian màu, định nghĩa màu có xu hướng lục (di chuyển về phía -100%) hay đỏ (di chuyển về phía +100%) như thế nào.

Lưu ý rằng các giá trị này có dấu (cho phép cả giá trị dương và âm) và về lý thuyết không bị giới hạn, nghĩa là bạn có thể đặt giá trị ngoài giới hạn ±125 hoặc ±0.4 (±100%). Trên thực tế, các giá trị không thể vượt quá ±160 hoặc ±0.5 tương ứng.

Giá trị `b` có cùng ràng buộc. Nó chỉ định khoảng cách của màu dọc theo trục b trong không gian màu, định nghĩa màu có xu hướng lam (di chuyển về phía -100%) hay vàng (di chuyển về phía +100%) như thế nào.

Ví dụ sau đây minh họa các hiệu ứng của việc thay đổi trục `a` qua hàm `lab()` và trục `b` qua hàm `oklab()`.

```html hidden live-sample___lab-colors
<div class="container"></div>
```

```css hidden live-sample___lab-colors
/* Varying shades of pink */
.container {
  display: grid;
  font-family: sans-serif;
  font-size: 14px;
  color: white;
  grid-template-columns: repeat(5, 1fr);
  gap: 4px;
}
.container div {
  border-radius: 8px;
  padding: 8px 4px;
}
```

```js hidden live-sample___lab-colors
const container = document.querySelector(".container");

for (let a = -100; a <= 100; a += 25) {
  const div = document.createElement("div");
  div.textContent = div.style.backgroundColor = `lab(50% ${a}% 0)`;
  container.appendChild(div);
}
container.appendChild(document.createElement("div"));
for (let b = -4; b <= 4; b++) {
  const div = document.createElement("div");
  div.textContent = div.style.backgroundColor = `oklab(50% 0 ${b / 10})`;
  container.appendChild(div);
}
```

{{embedlivesample("lab-colors", '100', '150') }}

## Ký hiệu hàm màu bổ sung

### Hàm `color()`

Nếu bạn muốn kiểm soát tường minh về không gian màu khi định nghĩa màu sắc, bạn có thể dùng hàm [`color()`](/en-US/docs/Web/CSS/Reference/Values/color_value/color).

Điều này hữu ích để mô tả màu sắc cho các thiết bị độ phân giải cao với [gamut](/en-US/docs/Glossary/Gamut) màu rộng hơn.
Ví dụ, nếu bạn muốn hiển thị màu `display-p3 0 0 1`, nằm ngoài gamut sRGB, bạn có thể dùng at-rule `@media` [`color-gamut`](/en-US/docs/Web/CSS/Reference/At-rules/@media/color-gamut) để phát hiện xem phần cứng của client có hỗ trợ màu sắc trong phạm vi này trước khi thử sử dụng nó:

```css
.vibrant {
  background-color: color(srgb 0 0 1);
}

@media (color-gamut: p3) {
  .vibrant {
    background-color: color(display-p3 0 0 1);
    /* Equivalent to out-of-gamut color(srgb 0 0 1.042) */
  }
}
```

Hiểu `color()` rất quan trọng khi nói đến relative colors, được thảo luận tiếp theo. Các ký hiệu màu sRGB cũ hơn được thảo luận ở trên — `hsl()`, `hwb()`, và `rgb()` — không biểu diễn toàn bộ phổ màu sắc có thể nhìn thấy, trong khi hàm `color()` hỗ trợ gamut màu rộng hơn nhiều. Do đó, khi sử dụng các kiểu hàm cũ hơn để định nghĩa relative colors, màu đầu ra được trả về bằng cách truy vấn thuộc tính {{domxref("HTMLElement.style")}} hoặc phương thức {{domxref("CSSStyleDeclaration.getPropertyValue()")}} sẽ là giá trị `color(srgb ...)`.

Để xem ví dụ về chuyển đổi `rgb()`, `hsl()`, `hwb()`, và các [định dạng màu](/en-US/docs/Web/CSS/Reference/Values/color_value) khác, hãy xem [công cụ chuyển đổi định dạng màu](/en-US/docs/Web/CSS/Guides/Colors/Color_format_converter) của chúng tôi.

### Relative colors

Mọi hàm màu được liệt kê ở trên đều có thể được sử dụng để định nghĩa [**relative colors**](/en-US/docs/Web/CSS/Guides/Colors/Using_relative_colors), cho phép giá trị {{cssxref("&lt;color&gt;")}} được định nghĩa tương đối so với các màu hiện có khác, thay vì định nghĩa giá trị màu từ đầu mỗi lần. Tính năng mạnh mẽ này cho phép tạo ra các bổ sung cho màu hiện có — chẳng hạn như các biến thể sáng hơn, tối hơn, bão hòa hơn, bán trong suốt, hoặc đảo ngược của màu gốc. Relative colors cung cấp cơ chế hiệu quả để tạo bảng màu và định nghĩa các điều chỉnh màu. Xem từng trang hàm màu để tìm hiểu thêm về cú pháp tương đối của chúng.

Như đã lưu ý ở trên, khi sử dụng `rgb()`, `hsl()`, hoặc `hwb()` để xuất relative color, màu đầu ra sẽ là hàm `color()` trong không gian màu `srgb`.

### Hàm color-mix()

Hàm {{cssxref("color_value/color-mix", "color-mix()")}} nhận hai giá trị màu theo bất kỳ cú pháp nào đã đề cập ở trên, tùy chọn với giá trị phần trăm tỷ lệ cho mỗi màu, và trả về kết quả của việc trộn chúng trong một không gian màu nhất định theo lượng nhất định.

### Hàm light-dark()

Hàm {{cssxref("color_value/light-dark", "light-dark()")}} cho phép bạn chỉ định hai giá trị màu cho một thuộc tính dùng cho chế độ màu sáng và tối tương ứng. Cái nào được đặt phụ thuộc vào việc developer đã đặt hay người dùng đã yêu cầu chế độ màu sáng hay tối. Đây là hàm tắt, cho phép bạn đạt được kết quả tương tự như truy vấn tính năng media {{cssxref("@media/prefers-color-scheme", "prefers-color-scheme")}} nhưng với ít code hơn.

## Xem thêm

- [Applying color to HTML elements using CSS](/en-US/docs/Web/CSS/Guides/Colors/Applying_color)
- [Using color wisely](/en-US/docs/Web/CSS/Guides/Colors/Using_color_wisely)
- [Using relative colors](/en-US/docs/Web/CSS/Guides/Colors/Using_relative_colors)
- [Understanding color and luminance](/en-US/docs/Web/Accessibility/Guides/Colors_and_Luminance)
- [WCAG 1.4.1: Color contrast](/en-US/docs/Web/Accessibility/Guides/Understanding_WCAG/Perceivable/Color_contrast)
- [CSS color module](/en-US/docs/Web/CSS/Guides/Colors)
