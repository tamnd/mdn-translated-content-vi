---
title: Coordinate systems
slug: Web/API/CSSOM_view_API/Coordinate_systems
page-type: guide
---

{{DefaultAPISidebar("CSSOM view API")}}

Khi chỉ định vị trí của một pixel trong ngữ cảnh đồ họa (giống như khi chỉ định hệ thống tọa độ trong [đại số](https://en.wikipedia.org/wiki/Algebra)), vị trí của nó được định nghĩa tương đối so với một điểm cố định trong ngữ cảnh. Điểm cố định này được gọi là [gốc tọa độ](<https://en.wikipedia.org/wiki/Origin_(mathematics)>). Vị trí được chỉ định là số pixel lệch từ gốc tọa độ theo từng chiều của ngữ cảnh.

Hướng dẫn này mô tả các hệ thống tọa độ tiêu chuẩn được sử dụng bởi mô hình đối tượng CSS. Chúng thường chỉ khác nhau về vị trí gốc tọa độ.

## Các chiều

Trong các hệ thống tọa độ được sử dụng bởi công nghệ web, độ lệch ngang được gọi là _tọa độ x_, trong đó giá trị âm chỉ vị trí bên trái của gốc tọa độ và giá trị dương là bên phải. _Tọa độ y_ chỉ độ lệch dọc, với giá trị âm ở trên gốc tọa độ và giá trị dương ở bên dưới.

Trên web, gốc tọa độ mặc định là góc _trên bên trái_ của một ngữ cảnh nhất định (với giá trị tọa độ y dương ở bên dưới gốc tọa độ). Lưu ý rằng điều này khác với hầu hết các mô hình toán học, nơi gốc tọa độ ở góc _dưới bên trái_, với giá trị tọa độ y dương ở trên gốc tọa độ.

Khi sử dụng chiều thứ ba để xếp chồng các đối tượng từ trước ra sau, chúng ta sử dụng **trục z**. Trục z chạy từ người xem đến bề mặt màn hình. Giá trị thuộc tính CSS {{cssxref("z-index")}} ảnh hưởng đến vị trí của các phần tử định vị trên trục này, tạo ra hiệu ứng di chuyển ra xa hoặc về phía người xem.

> [!NOTE]
> Có thể thay đổi định nghĩa và hướng của các hệ thống tọa độ này bằng cách sử dụng các thuộc tính CSS như {{cssxref("transform")}}. Tuy nhiên, chúng ta chỉ nói về hệ thống tọa độ tiêu chuẩn.

## Các hệ thống tọa độ CSSOM tiêu chuẩn

Có bốn hệ thống tọa độ tiêu chuẩn được sử dụng bởi mô hình đối tượng CSS.
Để giúp hình dung các hệ thống chính, sơ đồ sau hiển thị màn hình với cửa sổ trình duyệt chứa nội dung được cuộn ra ngoài {{glossary("viewport")}}.
Nội dung trang được cuộn ra ngoài khung nhìn được hiển thị dưới dạng bán trong suốt phía trên cửa sổ trình duyệt để chỉ ra vị trí gốc tọa độ "page" sẽ nằm ở đâu.

![Màn hình lớn với cửa sổ trình duyệt nhỏ hơn hiển thị nửa dưới trang web; nửa trên được hiển thị như cuộn ra ngoài khung nhìn trình duyệt. Góc trên bên trái của màn hình, trang và khung nhìn đều được gán nhãn với tọa độ 0,0.](css-coords.svg)

### Offset

Tọa độ được chỉ định bằng mô hình "offset" sử dụng góc trên bên trái của phần tử đang được kiểm tra, hoặc nơi xảy ra sự kiện.

Ví dụ, khi xảy ra [sự kiện chuột](/en-US/docs/Web/API/MouseEvent), vị trí của chuột được chỉ định trong các thuộc tính {{domxref("MouseEvent.offsetX", "offsetX")}} và {{domxref("MouseEvent.offsetY", "offsetY")}} của sự kiện được đưa ra tương đối so với góc trên bên trái của nút mà sự kiện đã được gửi đến.

### Viewport

Hệ thống tọa độ "viewport" (hoặc "client") sử dụng làm gốc tọa độ góc trên bên trái của khung nhìn hoặc ngữ cảnh duyệt web nơi xảy ra sự kiện.

Trên máy tính để bàn, ví dụ, các thuộc tính {{domxref("MouseEvent.clientX")}} và {{domxref("MouseEvent.clientY")}} chỉ vị trí con trỏ chuột tại thời điểm sự kiện xảy ra, tương đối so với góc trên bên trái của {{domxref("window")}}.

Góc trên bên trái của cửa sổ luôn là `(0, 0)`, bất kể nội dung tài liệu hoặc bất kỳ cuộn nào có thể đã được thực hiện.

### Page

Hệ thống tọa độ "page" cung cấp vị trí của một pixel tương đối so với góc trên bên trái của toàn bộ {{domxref("Document")}} được kết xuất.
Điều đó có nghĩa là một điểm trong phần tử trong tài liệu sẽ có cùng tọa độ sau khi người dùng cuộn ngang hoặc dọc trong tài liệu trừ khi phần tử di chuyển qua thay đổi bố cục.

Các thuộc tính {{domxref("MouseEvent.pageX", "pageX")}} và {{domxref("MouseEvent.pageY", "pageY")}} của sự kiện chuột cung cấp vị trí của chuột tại thời điểm sự kiện được tạo ra, được đưa ra tương đối so với góc trên bên trái của tài liệu.

### Screen

Cuối cùng, chúng ta đến với mô hình "screen" nơi gốc tọa độ là góc trên bên trái của không gian màn hình của người dùng.
Mỗi điểm trong hệ thống tọa độ này đại diện cho một pixel logic đơn, vì vậy các giá trị tăng và giảm theo giá trị nguyên theo từng trục.
Vị trí của một điểm nhất định trong tài liệu sẽ thay đổi nếu cửa sổ chứa được di chuyển, ví dụ, hoặc nếu hình học màn hình của người dùng thay đổi.

Các thuộc tính {{domxref("MouseEvent.screenX")}} và {{domxref("MouseEvent.screenY")}} cung cấp tọa độ vị trí sự kiện chuột tương đối so với gốc tọa độ màn hình.

## Ví dụ

Hãy xem ví dụ ghi nhật ký tọa độ chuột trong một phần tử.
Mỗi khi chuột vào, di chuyển bên trong, hoặc thoát ra khỏi hộp bên trong, các sự kiện được xử lý bằng cách ghi lại tọa độ chuột hiện tại trong mỗi hệ thống bốn hệ thống có sẵn.

### JavaScript

```js
const log = document.querySelector(".log");
const inner = document.querySelector(".inner");

function setCoords(e) {
  log.innerText = `
Offset X/Y: ${e.offsetX}, ${e.offsetY}
Viewport X/Y: ${e.clientX}, ${e.clientY}
Page X/Y: ${e.pageX}, ${e.pageY}
Screen X/Y: ${e.screenX}, ${e.screenY}`;
}

inner.addEventListener("mousemove", setCoords);
inner.addEventListener("mouseenter", setCoords);
inner.addEventListener("mouseleave", setCoords);
```

### HTML

```html
<div class="outer">
  <div class="inner">
    <p>Di chuyển chuột của bạn quanh hộp bên trong này.</p>
  </div>
</div>
<pre class="log">
Di chuyển chuột của bạn để xem tọa độ chuột.
</pre>
```

### CSS

```css
.outer {
  width: 250px;
  height: 250px;
  display: flex;
  justify-content: center;
  align-items: center;
  background-color: lemonchiffon;
}

.inner {
  width: 200px;
  height: 200px;
  display: flex;
  justify-content: center;
  align-items: center;
  background-color: palegreen;
}
```

{{EmbedLiveSample("Example", 600, 300)}}

## Xem thêm

- [Sử dụng chuyển đổi CSS](/en-US/docs/Web/CSS/Guides/Transforms/Using_CSS_transforms): cách thay đổi hệ thống tọa độ
- Tọa độ của sự kiện chuột: {{domxref("MouseEvent.offsetX", "offsetX")}}, {{domxref("MouseEvent.offsetY", "offsetY")}}, {{domxref("MouseEvent.clientX", "clientX")}}, {{domxref("MouseEvent.clientY", "clientY")}}, {{domxref("MouseEvent.pageX", "pageX")}}, {{domxref("MouseEvent.pageY", "pageY")}}, {{domxref("MouseEvent.screenX", "screenX")}}, và {{domxref("MouseEvent.screenY", "screenY")}}
