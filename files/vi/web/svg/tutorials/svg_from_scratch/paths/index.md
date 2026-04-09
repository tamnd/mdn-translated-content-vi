---
title: Path
slug: Web/SVG/Tutorials/SVG_from_scratch/Paths
page-type: tutorial-chapter
sidebar: svgref
---

{{ PreviousNext("Web/SVG/Tutorials/SVG_from_scratch/Basic_shapes", "Web/SVG/Tutorials/SVG_from_scratch/Fills_and_strokes") }}

Phần tử {{SVGElement('path')}} là phần tử mạnh nhất trong thư viện [hình cơ bản](/en-US/docs/Web/SVG/Tutorials/SVG_from_scratch/Basic_shapes) của SVG. Nó có thể được dùng để tạo các đường thẳng, đường cong, cung tròn, và nhiều hơn nữa.

Path tạo các hình phức tạp bằng cách kết hợp nhiều đường thẳng hoặc đường cong. Các hình phức tạp chỉ gồm đường thẳng có thể được tạo bằng các phần tử [`<polyline>`](/en-US/docs/Web/SVG/Tutorials/SVG_from_scratch/Basic_shapes#polyline). Mặc dù phần tử `<polyline>` và `<path>` có thể tạo ra các hình nhìn tương tự, phần tử `<polyline>` cần rất nhiều đoạn thẳng ngắn để mô phỏng đường cong và không co giãn tốt tới kích thước lớn hơn.

Hiểu path là điều quan trọng khi vẽ SVG. Mặc dù không nên tạo path phức tạp bằng trình soạn thảo XML hoặc trình soạn thảo văn bản, việc hiểu cách chúng hoạt động sẽ giúp bạn xác định và sửa các vấn đề hiển thị trong SVG.

Hình dạng của một phần tử `<path>` được xác định bởi một tham số: {{ SVGAttr("d") }}. (Xem thêm trong [basic shapes](/en-US/docs/Web/SVG/Tutorials/SVG_from_scratch/Basic_shapes).) Thuộc tính `d` chứa một chuỗi các lệnh và tham số được các lệnh đó dùng.

Mỗi lệnh được khởi tạo (ví dụ, tạo một lớp, đặt tên và xác định vị trí cho nó) bằng một chữ cái cụ thể. Chẳng hạn, hãy di chuyển tới tọa độ x và y (`10`, `10`). Lệnh "Move to" được gọi bằng chữ cái `M`. Khi bộ phân tích gặp chữ cái này, nó biết rằng nó cần di chuyển tới một điểm. Vì vậy, để di chuyển tới (`10`, `10`) lệnh cần dùng sẽ là `M 10 10`. Sau đó, bộ phân tích bắt đầu đọc lệnh tiếp theo.

Tất cả các lệnh cũng có hai biến thể. Một **chữ cái in hoa** chỉ định tọa độ tuyệt đối trên trang, và một **chữ cái viết thường** chỉ định tọa độ tương đối (ví dụ, _di chuyển 10px lên trên và 7px sang trái từ điểm cuối cùng_).

Các tọa độ trong tham số `d` **luôn không có đơn vị** và vì vậy nằm trong hệ tọa độ người dùng. Sau này, chúng ta sẽ tìm hiểu cách path có thể được biến đổi để phù hợp với các nhu cầu khác.

## Các lệnh đường thẳng

Có năm lệnh đường thẳng cho các nút {{SVGElement("path")}}. Lệnh đầu tiên là "Move To" hay `M`, đã được mô tả ở trên. Nó nhận hai tham số, một tọa độ (`x`) và tọa độ (`y`) để di chuyển tới. Nếu con trỏ đã ở đâu đó trên trang, sẽ không có đường nào được vẽ để nối hai vị trí. Lệnh "Move To" xuất hiện ở đầu các path để chỉ định nơi việc vẽ nên bắt đầu. Ví dụ:

```plain
M x y
(or)
m dx dy
```

Trong ví dụ sau chỉ có một điểm tại (`10`, `10`). Tuy nhiên, lưu ý rằng nó sẽ không hiển thị nếu chỉ vẽ path theo cách thông thường. Ví dụ:

```html live-sample___move-to
<svg width="100" height="100" xmlns="http://www.w3.org/2000/svg">
  <path d="M10 10" />
</svg>
```

```html hidden live-sample___move-to
<svg style="display:none" xmlns="http://www.w3.org/2000/svg">
  <g id="reference">
    <circle cx="10" cy="10" r="3" fill="red" />
  </g>
</svg>
<button>Show/hide reference points and lines</button>
```

```js hidden live-sample___move-to
const g = document.querySelector("#reference");
const svg = document.querySelector("svg");
const button = document.querySelector("button");
let isHidden = true;
button.addEventListener("click", () => {
  isHidden = !isHidden;
  if (isHidden) {
    svg.querySelector("#reference").remove();
  } else {
    svg.appendChild(g.cloneNode(true));
  }
});
```

{{ EmbedLiveSample('move-to', 100, 130) }}

Có ba lệnh vẽ đường thẳng. Tổng quát nhất là lệnh "Line To", được gọi bằng `L`. `L` nhận hai tham số - tọa độ x và y - và vẽ một đường từ vị trí hiện tại tới một vị trí mới.

```plain
L x y
(or)
l dx dy
```

Có hai dạng rút gọn để vẽ đường ngang và đường dọc. `H` vẽ một đường ngang, và `V` vẽ một đường dọc. Cả hai lệnh chỉ nhận một tham số vì chúng chỉ di chuyển theo một hướng.

```plain
H x
(or)
h dx

V y
(or)
v dy
```

Một cách dễ bắt đầu là vẽ một hình. Chúng ta sẽ bắt đầu với một hình chữ nhật (cùng loại mà có thể dễ dàng tạo hơn bằng phần tử {{SVGElement("rect")}}). Nó chỉ gồm các đường ngang và dọc.

```html live-sample___rectangle-lines
<svg width="100" height="100" xmlns="http://www.w3.org/2000/svg">
  <path d="M 10 10 H 90 V 90 H 10 L 10 10" />
</svg>
```

```html hidden live-sample___rectangle-lines
<svg style="display:none" xmlns="http://www.w3.org/2000/svg">
  <g id="reference">
    <circle cx="10" cy="10" r="3" fill="red" />
    <circle cx="90" cy="90" r="3" fill="red" />
    <circle cx="90" cy="10" r="3" fill="red" />
    <circle cx="10" cy="90" r="3" fill="red" />
  </g>
</svg>
<button>Show/hide reference points and lines</button>
```

```js hidden live-sample___rectangle-lines
const g = document.querySelector("#reference");
const svg = document.querySelector("svg");
const button = document.querySelector("button");
let isHidden = true;
button.addEventListener("click", () => {
  isHidden = !isHidden;
  if (isHidden) {
    svg.querySelector("#reference").remove();
  } else {
    svg.appendChild(g.cloneNode(true));
  }
});
```

{{ EmbedLiveSample('rectangle-lines', 100, 130) }}

Chúng ta có thể rút ngắn khai báo path ở trên một chút bằng cách dùng lệnh "Close Path", được gọi bằng `Z`. Lệnh này vẽ một đường thẳng từ vị trí hiện tại quay lại điểm chưa đóng đầu tiên (điểm đầu tiên sau lệnh `Z` cuối cùng nếu có, hoặc điểm đầu tiên trong path nếu không), và đóng path lại bằng một khớp đường. Nó thường được đặt ở cuối một nút path, dù không phải lúc nào cũng vậy. Không có khác biệt nào giữa lệnh viết hoa và viết thường.

```plain
Z
(or)
z
```

Vậy path ở trên có thể được rút ngắn thành:

```xml
<path d="M 10 10 H 90 V 90 H 10 Z" fill="transparent" stroke="black" />
```

Các dạng tương đối của những lệnh này cũng có thể được dùng để vẽ cùng một hình. Lệnh tương đối được gọi bằng các chữ cái viết thường, và thay vì di chuyển con trỏ tới một tọa độ chính xác, chúng di chuyển nó tương đối với vị trí cuối cùng của nó. Ví dụ, vì hình chữ nhật của chúng ta là 80×80, phần tử `<path>` có thể đã được viết như sau:

```xml
<path d="M 10 10 h 80 v 80 h -80 Z" fill="transparent" stroke="black" />
```

Path sẽ di chuyển tới điểm (`10`, `10`) rồi di chuyển ngang 80 điểm sang phải, sau đó 80 điểm xuống dưới, rồi 80 điểm sang trái, và cuối cùng quay về điểm đầu.

Trong các ví dụ này, có lẽ sẽ trực quan hơn nếu dùng các phần tử {{SVGElement("polygon")}} hoặc {{SVGElement("polyline")}}. Tuy nhiên, path được dùng rất thường xuyên trong việc vẽ SVG nên các nhà phát triển có thể cảm thấy quen tay hơn khi dùng chúng. Không có phạt hay lợi thế hiệu năng thực sự nào khi dùng cái này thay vì cái kia.

## Các lệnh đường cong

Có ba lệnh khác nhau có thể dùng để tạo các đường cong mượt. Hai trong số đó là [đường cong Bézier](/en-US/docs/Glossary/Bezier_curve), và cái còn lại là một "arc" hay một phần của đường tròn. Có lẽ bạn đã có kinh nghiệm thực hành với đường cong Bézier bằng các công cụ path trong Inkscape, Illustrator hoặc Photoshop. Có vô số đường cong Bézier, nhưng trong các phần tử `<path>` chỉ có hai loại: loại bậc ba, được gọi bằng `C`, và loại bậc hai, được gọi bằng `Q`.

### Đường cong Bézier

Đường cong bậc ba, `C`, là đường cong phức tạp hơn một chút. Bézier bậc ba nhận hai điểm điều khiển cho mỗi điểm. Vì vậy, để tạo một Bézier bậc ba, cần chỉ định ba bộ tọa độ.

```plain
C x1 y1, x2 y2, x y
(or)
c dx1 dy1, dx2 dy2, dx dy
```

Bộ tọa độ cuối cùng ở đây (`x`, `y`) chỉ định nơi đường nên kết thúc. Hai bộ còn lại là các điểm điều khiển. (`x1`, `y1`) là điểm điều khiển cho đầu của đường cong, và (`x2`, `y2`) là điểm điều khiển cho cuối. Các điểm điều khiển về cơ bản mô tả độ dốc của đường bắt đầu tại mỗi điểm. Hàm Bézier sau đó tạo ra một đường cong mượt chuyển từ độ dốc được thiết lập ở đầu đường sang độ dốc ở đầu kia.

```html live-sample___cubic_bezier_curves
<svg width="190" height="160" xmlns="http://www.w3.org/2000/svg">
  <path d="M 10 10 C 20 20, 40 20, 50 10" stroke="black" fill="transparent" />
  <path d="M 70 10 C 70 20, 110 20, 110 10" stroke="black" fill="transparent" />
  <path
    d="M 130 10 C 120 20, 180 20, 170 10"
    stroke="black"
    fill="transparent" />
  <path d="M 10 60 C 20 80, 40 80, 50 60" stroke="black" fill="transparent" />
  <path d="M 70 60 C 70 80, 110 80, 110 60" stroke="black" fill="transparent" />
  <path
    d="M 130 60 C 120 80, 180 80, 170 60"
    stroke="black"
    fill="transparent" />
  <path
    d="M 10 110 C 20 140, 40 140, 50 110"
    stroke="black"
    fill="transparent" />
  <path
    d="M 70 110 C 70 140, 110 140, 110 110"
    stroke="black"
    fill="transparent" />
  <path
    d="M 130 110 C 120 140, 180 140, 170 110"
    stroke="black"
    fill="transparent" />
</svg>
```

```html hidden live-sample___cubic_bezier_curves
<svg style="display:none" xmlns="http://www.w3.org/2000/svg">
  <g id="reference"></g>
</svg>
<button>Show/hide reference points and lines</button>
```

```js hidden live-sample___cubic_bezier_curves
const g = document.querySelector("#reference");
const svg = document.querySelector("svg");
const button = document.querySelector("button");

// prettier-ignore
const points = [
  [[10, 10], [20, 20], [40, 20], [50, 10]],
  [[70, 10], [70, 20], [110, 20], [110, 10]],
  [[130, 10], [120, 20], [180, 20], [170, 10]],
  [[10, 60], [20, 80], [40, 80], [50, 60]],
  [[70, 60], [70, 80], [110, 80], [110, 60]],
  [[130, 60], [120, 80], [180, 80], [170, 60]],
  [[10, 110], [20, 140], [40, 140], [50, 110]],
  [[70, 110], [70, 140], [110, 140], [110, 110]],
  [[130, 110], [120, 140], [180, 140], [170, 110]],
];

for (const curvePoints of points) {
  for (const p of curvePoints) {
    const circle = document.createElementNS(
      "http://www.w3.org/2000/svg",
      "circle",
    );
    circle.setAttribute("cx", p[0]);
    circle.setAttribute("cy", p[1]);
    circle.setAttribute("r", 1.5);
    circle.setAttribute("fill", "red");
    g.appendChild(circle);
  }
  const line1 = document.createElementNS("http://www.w3.org/2000/svg", "line");
  line1.setAttribute("x1", curvePoints[0][0]);
  line1.setAttribute("y1", curvePoints[0][1]);
  line1.setAttribute("x2", curvePoints[1][0]);
  line1.setAttribute("y2", curvePoints[1][1]);
  line1.setAttribute("stroke", "red");
  g.appendChild(line1);
  const line2 = document.createElementNS("http://www.w3.org/2000/svg", "line");
  line2.setAttribute("x1", curvePoints[2][0]);
  line2.setAttribute("y1", curvePoints[2][1]);
  line2.setAttribute("x2", curvePoints[3][0]);
  line2.setAttribute("y2", curvePoints[3][1]);
  line2.setAttribute("stroke", "red");
  g.appendChild(line2);
}

let isHidden = true;
button.addEventListener("click", () => {
  isHidden = !isHidden;
  if (isHidden) {
    svg.querySelector("#reference").remove();
  } else {
    svg.appendChild(g.cloneNode(true));
  }
});
```

{{ EmbedLiveSample('cubic_bezier_curves', 190, 190) }}

Ví dụ trên tạo chín đường cong Bézier bậc ba. Khi các đường cong dịch sang phải, các điểm điều khiển tách nhau xa hơn theo chiều ngang. Khi các đường cong đi xuống dưới, chúng tách xa hơn khỏi các điểm cuối. Điểm cần lưu ý ở đây là đường cong bắt đầu theo hướng của điểm điều khiển thứ nhất, rồi uốn cong để đi tới theo hướng của điểm điều khiển thứ hai.

Một số đường cong Bézier có thể được nối lại với nhau để tạo ra các hình kéo dài, mượt mà. Thường thì điểm điều khiển ở một phía của một điểm sẽ là ảnh phản chiếu của điểm điều khiển được dùng ở phía còn lại để giữ độ dốc không đổi. Trong trường hợp này, có thể dùng một biến thể rút gọn của Bézier bậc ba, được ký hiệu bằng lệnh `S` (hoặc `s`).

```plain
S x2 y2, x y
(or)
s dx2 dy2, dx dy
```

`S` tạo ra cùng kiểu đường cong như trước - nhưng nếu nó theo sau một lệnh `S` hoặc `C` khác, điểm điều khiển đầu tiên được giả định là ảnh phản chiếu của điểm đã dùng trước đó. Nếu lệnh `S` không theo sau một `S` hoặc `C` khác, thì vị trí hiện tại của con trỏ sẽ được dùng làm điểm điều khiển đầu tiên. Kết quả không giống hệt như lệnh `Q` sẽ tạo ra với cùng tham số, nhưng khá tương tự.

Ví dụ về cú pháp này được hiển thị bên dưới, và trong hình bên trái, các điểm điều khiển đã chỉ định được hiển thị bằng màu đỏ, còn điểm điều khiển suy ra được hiển thị bằng màu xanh dương.

```html live-sample___shortcut_cubic_bezier
<svg width="190" height="160" xmlns="http://www.w3.org/2000/svg">
  <path
    d="M 10 80 C 40 10, 65 10, 95 80 S 150 150, 180 80"
    stroke="black"
    fill="transparent" />
</svg>
```

```html hidden live-sample___shortcut_cubic_bezier
<svg style="display:none" xmlns="http://www.w3.org/2000/svg">
  <g id="reference">
    <line x1="10" y1="80" x2="40" y2="10" stroke="red" />
    <line x1="65" y1="10" x2="95" y2="80" stroke="red" />
    <line x1="95" y1="80" x2="125" y2="150" stroke="blue" />
    <line x1="150" y1="150" x2="180" y2="80" stroke="red" />
    <circle cx="10" cy="80" r="3" fill="red" />
    <circle cx="40" cy="10" r="3" fill="red" />
    <circle cx="65" cy="10" r="3" fill="red" />
    <circle cx="95" cy="80" r="3" fill="red" />
    <circle cx="125" cy="150" r="3" fill="blue" />
    <circle cx="150" cy="150" r="3" fill="red" />
    <circle cx="180" cy="80" r="3" fill="red" />
  </g>
</svg>
<button>Show/hide reference points and lines</button>
```

```js hidden live-sample___shortcut_cubic_bezier
const g = document.querySelector("#reference");
const svg = document.querySelector("svg");
const button = document.querySelector("button");
let isHidden = true;
button.addEventListener("click", () => {
  isHidden = !isHidden;
  if (isHidden) {
    svg.querySelector("#reference").remove();
  } else {
    svg.appendChild(g.cloneNode(true));
  }
});
```

{{ EmbedLiveSample('shortcut_cubic_bezier', 190, 190) }}

Loại đường cong Bézier còn lại, đường cong bậc hai được gọi bằng `Q`, thực ra là một đường cong đơn giản hơn đường bậc ba. Nó cần một điểm điều khiển xác định độ dốc của đường cong ở cả điểm bắt đầu lẫn điểm kết thúc. Nó nhận hai tham số: điểm điều khiển và điểm kết thúc của đường cong.

> [!NOTE]
> Độ lệch tọa độ cho `q` đều là tương đối so với điểm trước đó (tức là `dx` và `dy` không tương đối với `dx1` và `dy1`).

```plain
Q x1 y1, x y
(or)
q dx1 dy1, dx dy
```

```html live-sample___quadratic_bezier
<svg width="190" height="160" xmlns="http://www.w3.org/2000/svg">
  <path d="M 10 80 Q 95 10 180 80" stroke="black" fill="transparent" />
</svg>
```

```html hidden live-sample___quadratic_bezier
<svg style="display:none" xmlns="http://www.w3.org/2000/svg">
  <g id="reference">
    <line x1="10" y1="80" x2="95" y2="10" stroke="red" />
    <line x1="95" y1="10" x2="180" y2="80" stroke="red" />
    <circle cx="10" cy="80" r="3" fill="red" />
    <circle cx="180" cy="80" r="3" fill="red" />
    <circle cx="95" cy="10" r="3" fill="red" />
  </g>
</svg>
<button>Show/hide reference points and lines</button>
```

```js hidden live-sample___quadratic_bezier
const g = document.querySelector("#reference");
const svg = document.querySelector("svg");
const button = document.querySelector("button");
let isHidden = true;
button.addEventListener("click", () => {
  isHidden = !isHidden;
  if (isHidden) {
    svg.querySelector("#reference").remove();
  } else {
    svg.appendChild(g.cloneNode(true));
  }
});
```

{{ EmbedLiveSample('quadratic_bezier', 190, 190) }}

Giống như đường cong Bézier bậc ba, cũng có một lệnh rút gọn để nối nhiều Bézier bậc hai, được gọi bằng `T`.

```plain
T x y
(or)
t dx dy
```

Lệnh rút gọn này nhìn vào điểm điều khiển trước đó đã dùng và suy ra một điểm mới từ nó. Điều này có nghĩa là sau điểm điều khiển đầu tiên, có thể tạo ra các hình khá phức tạp chỉ bằng cách chỉ định các điểm kết thúc.

Lệnh này chỉ hoạt động nếu lệnh trước đó là `Q` hoặc `T`. Nếu không, điểm điều khiển được giả định là giống như điểm trước đó, và chỉ có các đường thẳng được vẽ.

```html live-sample___shortcut_quadratic_bezier
<svg width="190" height="160" xmlns="http://www.w3.org/2000/svg">
  <path
    d="M 10 80 Q 52.5 10, 95 80 T 180 80"
    stroke="black"
    fill="transparent" />
</svg>
```

```html hidden live-sample___shortcut_quadratic_bezier
<svg style="display:none" xmlns="http://www.w3.org/2000/svg">
  <g id="reference">
    <line x1="10" y1="80" x2="52.5" y2="10" stroke="red" />
    <line x1="52.5" y1="10" x2="95" y2="80" stroke="red" />
    <line x1="95" y1="80" x2="137.5" y2="150" stroke="blue" />
    <line x1="137.5" y1="150" x2="180" y2="80" stroke="blue" />
    <circle cx="10" cy="80" r="3" fill="red" />
    <circle cx="52.5" cy="10" r="3" fill="red" />
    <circle cx="95" cy="80" r="3" fill="red" />
    <circle cx="137.5" cy="150" r="3" fill="blue" />
    <circle cx="180" cy="80" r="3" fill="blue" />
  </g>
</svg>
<button>Show/hide reference points and lines</button>
```

```js hidden live-sample___shortcut_quadratic_bezier
const g = document.querySelector("#reference");
const svg = document.querySelector("svg");
const button = document.querySelector("button");
let isHidden = true;
button.addEventListener("click", () => {
  isHidden = !isHidden;
  if (isHidden) {
    svg.querySelector("#reference").remove();
  } else {
    svg.appendChild(g.cloneNode(true));
  }
});
```

{{ EmbedLiveSample('shortcut_quadratic_bezier', 190, 190) }}

Cả hai đường cong cho kết quả tương tự nhau, mặc dù đường bậc ba cho phép tự do lớn hơn đối với hình dạng chính xác của đường cong. Việc chọn dùng đường nào là tùy tình huống và phụ thuộc vào mức độ đối xứng của đường.

### Cung tròn

Kiểu đường cong còn lại có thể tạo bằng SVG là cung tròn, được gọi bằng lệnh `A`. Cung tròn là các đoạn của đường tròn hoặc ellipse.

Với một bán kính x và bán kính y nhất định, có hai ellipse có thể nối bất kỳ hai điểm nào (miễn là chúng nằm trong bán kính của đường tròn). Trên mỗi ellipse đó, có hai đường đi có thể được dùng để nối các điểm - vì vậy trong bất kỳ tình huống nào, sẽ có bốn cung khả dĩ.

Vì vậy, cung tròn cần khá nhiều tham số:

```plain
A rx ry x-axis-rotation large-arc-flag sweep-flag x y
a rx ry x-axis-rotation large-arc-flag sweep-flag dx dy
```

Ở đầu của nó, phần tử arc nhận hai tham số cho bán kính x và bán kính y. Nếu cần, xem các phần tử {{SVGElement("ellipse")}} và cách chúng hoạt động. Hai tham số cuối chỉ định tọa độ x và y nơi nét vẽ kết thúc. Kết hợp lại, bốn giá trị này xác định cấu trúc cơ bản của cung tròn.

Tham số thứ ba mô tả phép xoay của cung tròn. Điều này được giải thích tốt nhất bằng một ví dụ:

```html live-sample___arcs_axis_rotation
<svg width="320" height="320" xmlns="http://www.w3.org/2000/svg">
  <path
    d="M 10 315
       L 110 215
       A 30 50 0 0 1 162.55 162.45
       L 172.55 152.45
       A 30 50 -45 0 1 215.1 109.9
       L 315 10"
    stroke="black"
    fill="green"
    stroke-width="2"
    fill-opacity="0.5" />
</svg>
```

```html hidden live-sample___arcs_axis_rotation
<svg style="display:none" xmlns="http://www.w3.org/2000/svg">
  <g id="reference">
    <ellipse
      cx="136.225"
      cy="188.275"
      rx="30"
      ry="50"
      stroke="red"
      fill="none" />
    <ellipse
      cx="193.5"
      cy="131.5"
      rx="30"
      ry="50"
      stroke="red"
      fill="none"
      transform="rotate(-45)"
      transform-origin="193.5 131.5" />
  </g>
</svg>
<button>Show/hide reference points and lines</button>
```

```js hidden live-sample___arcs_axis_rotation
const g = document.querySelector("#reference");
const svg = document.querySelector("svg");
const button = document.querySelector("button");
let isHidden = true;
button.addEventListener("click", () => {
  isHidden = !isHidden;
  if (isHidden) {
    svg.querySelector("#reference").remove();
  } else {
    svg.appendChild(g.cloneNode(true));
  }
});
```

{{ EmbedLiveSample('arcs_axis_rotation', 320, 350) }}

Ví dụ này cho thấy một phần tử `<path>` đi chéo qua trang. Ở giữa nó, hai cung ellipse đã được cắt ra (bán kính x = `30`, bán kính y = `50`). Ở cung đầu tiên, x-axis-rotation được để là `0`, nên ellipse mà cung đi quanh (hiển thị màu xám) được định hướng thẳng đứng. Nhưng với cung thứ hai, x-axis-rotation được đặt là `-45` độ. Điều này xoay ellipse sao cho nó thẳng hàng với trục phụ dọc theo hướng của path, như ellipse thứ hai trong hình ví dụ.

Với ellipse không xoay trong hình trên, chỉ có hai cung khác nhau chứ không phải bốn vì đường thẳng vẽ từ điểm bắt đầu và điểm kết thúc của cung đi qua tâm ellipse. Trong một ví dụ sửa đổi nhẹ, có thể thấy hai ellipse tạo ra bốn cung khác nhau:

```html live-sample___arcs_axis_rotation_2
<svg xmlns="http://www.w3.org/2000/svg" width="320" height="320">
  <path
    d="M 10 315
       L 110 215
       A 36 60 0 0 1 150.71 170.29
       L 172.55 152.45
       A 30 50 -45 0 1 215.1 109.9
       L 315 10"
    stroke="black"
    fill="green"
    stroke-width="2"
    fill-opacity="0.5" />
</svg>
```

```html hidden live-sample___arcs_axis_rotation_2
<svg style="display:none" xmlns="http://www.w3.org/2000/svg">
  <g id="reference">
    <circle cx="150.71" cy="170.29" r="3" fill="red" />
    <circle cx="110" cy="215" r="3" fill="red" />
    <ellipse
      cx="144.931"
      cy="229.512"
      rx="36"
      ry="60"
      fill="transparent"
      stroke="red" />
    <ellipse
      cx="115.779"
      cy="155.778"
      rx="36"
      ry="60"
      fill="transparent"
      stroke="red" />
  </g>
</svg>
<button>Show/hide reference points and lines</button>
```

```js hidden live-sample___arcs_axis_rotation_2
const g = document.querySelector("#reference");
const svg = document.querySelector("svg");
const button = document.querySelector("button");
let isHidden = true;
button.addEventListener("click", () => {
  isHidden = !isHidden;
  if (isHidden) {
    svg.querySelector("#reference").remove();
  } else {
    svg.appendChild(g.cloneNode(true));
  }
});
```

{{ EmbedLiveSample('arcs_axis_rotation_2', 320, 350) }}

Hãy lưu ý rằng mỗi ellipse màu xanh được tạo thành từ hai cung, tùy theo việc đi theo chiều kim đồng hồ hay ngược chiều kim đồng hồ. Mỗi ellipse có một cung ngắn và một cung dài. Hai ellipse chỉ là ảnh phản chiếu của nhau. Chúng bị lật dọc theo đường được tạo bởi các điểm bắt đầu→kết thúc.

Nếu các điểm bắt đầu→kết thúc xa hơn phạm vi mà bán kính `x` và `y` của ellipse có thể vươn tới, các bán kính của ellipse sẽ được tăng tối thiểu để nó có thể chạm tới các điểm bắt đầu→kết thúc. Codepen tương tác ở cuối trang minh họa điều này rất tốt. Để xác định liệu bán kính của một ellipse có đủ lớn hay không và có cần phóng to không, cần giải một hệ phương trình, chẳng hạn [như thế này trên wolfram alpha](<https://www.wolframalpha.com/input/?i=solve+((110+-+x)%5E2%2F36%5E2)+%2B+((215+-+y)%5E2%2F60%5E2)+%3D+1,+((150.71+-+x)%5E2%2F36%5E2)+%2B+((170.29+-+y)%5E2%2F60%5E2)+%3D+1>). Tính toán này là cho ellipse không xoay với điểm bắt đầu→kết thúc (`110`, `215`)→(`150.71`, `170.29`). Nghiệm (`x`, `y`) là tâm của ellipse(s). Nghiệm sẽ [là số ảo](<https://www.wolframalpha.com/input/?i=solve+((110+-+x)%5E2%2F30%5E2)+%2B+((215+-+y)%5E2%2F50%5E2)+%3D+1,+((162.55+-+x)%5E2%2F30%5E2)+%2B+((162.45+-+y)%5E2%2F50%5E2)+%3D+1>) nếu bán kính của ellipse quá nhỏ. Phép tính thứ hai này là cho ellipse không xoay với điểm bắt đầu→kết thúc (`110`, `215`)→(`162.55`, `162.45`). Nghiệm có một phần ảo nhỏ vì ellipse đã được tăng kích thước vừa đủ.

Bốn đường đi khác nhau được nêu ở trên được xác định bởi hai cờ tham số tiếp theo. Như đã nói trước đó, vẫn có hai ellipse khả dĩ mà đường đi có thể đi quanh và hai đường đi khả dĩ trên cả hai ellipse, tạo ra bốn đường đi có thể có. Tham số đầu tiên là `large-arc-flag`. Nó xác định xem cung có lớn hơn hay nhỏ hơn 180 độ; xét cho cùng, cờ này quyết định hướng mà cung sẽ đi quanh một đường tròn đã cho. Tham số thứ hai là `sweep-flag`. Nó xác định xem cung có bắt đầu di chuyển ở các góc dương hay âm, về bản chất là chọn một trong hai đường tròn mà nó sẽ đi quanh. Ví dụ dưới đây cho thấy cả bốn tổ hợp khả dĩ, cùng với hai đường tròn cho mỗi trường hợp.

```html live-sample___arcs_flags
<svg width="360" height="360" xmlns="http://www.w3.org/2000/svg">
  <path
    d="M 100 100
       A 45 45, 0, 0, 0, 145 145
       L 145 100 Z"
    fill="#00FF00A0"
    stroke="black"
    stroke-width="2" />
  <path
    d="M 250 100
       A 45 45, 0, 1, 0, 295 145
       L 295 100 Z"
    fill="#FF0000A0"
    stroke="black"
    stroke-width="2" />
  <path
    d="M 100 250
       A 45 45, 0, 0, 1, 145 295
       L 145 250 Z"
    fill="#FF00FFA0"
    stroke="black"
    stroke-width="2" />
  <path
    d="M 250 250
       A 45 45, 0, 1, 1, 295 295
       L 295 250 Z"
    fill="#0000FFA0"
    stroke="black"
    stroke-width="2" />
  <path
    d="M 45 45 L 345 45 L 345 345 L 45 345 Z M 195 45 L 195 345 M 45 195 L 345 195"
    fill="none"
    stroke="black" />
  <text x="140" y="20" font-size="20" fill="black">Large arc flag</text>
  <text
    x="-15"
    y="195"
    font-size="20"
    fill="black"
    transform="rotate(-90)"
    transform-origin="20 195">
    Sweep flag
  </text>
  <text x="120" y="40" font-size="20" fill="black">0</text>
  <text x="270" y="40" font-size="20" fill="black">1</text>
  <text x="30" y="120" font-size="20" fill="black">0</text>
  <text x="30" y="270" font-size="20" fill="black">1</text>
</svg>
```

```html hidden live-sample___arcs_flags
<svg style="display:none" xmlns="http://www.w3.org/2000/svg">
  <g id="reference">
    <circle cx="145" cy="100" r="45" stroke="#888888E0" fill="none" />
    <circle cx="100" cy="145" r="45" stroke="#888888E0" fill="none" />
    <circle cx="295" cy="100" r="45" stroke="#888888E0" fill="none" />
    <circle cx="250" cy="145" r="45" stroke="#888888E0" fill="none" />
    <circle cx="145" cy="250" r="45" stroke="#888888E0" fill="none" />
    <circle cx="100" cy="295" r="45" stroke="#888888E0" fill="none" />
    <circle cx="295" cy="250" r="45" stroke="#888888E0" fill="none" />
    <circle cx="250" cy="295" r="45" stroke="#888888E0" fill="none" />
  </g>
</svg>
<button>Show/hide reference points and lines</button>
```

```js hidden live-sample___arcs_flags
const g = document.querySelector("#reference");
const svg = document.querySelector("svg");
const button = document.querySelector("button");
let isHidden = true;
button.addEventListener("click", () => {
  isHidden = !isHidden;
  if (isHidden) {
    svg.querySelector("#reference").remove();
  } else {
    svg.appendChild(g.cloneNode(true));
  }
});
```

{{ EmbedLiveSample('arcs_flags', 360, 390) }}

Arc là một cách dễ dàng để tạo các phần của hình tròn hoặc ellipse trong bản vẽ. Ví dụ, một biểu đồ tròn sẽ cần một arc riêng cho mỗi lát.

Nếu chuyển sang SVG từ {{HTMLElement("canvas")}}, arc có thể là thứ khó học nhất, nhưng cũng mạnh mẽ hơn nhiều. Hình tròn hoàn chỉnh và ellipse hoàn chỉnh là những hình duy nhất mà arc SVG gặp khó khi vẽ. Vì các điểm bắt đầu và kết thúc của bất kỳ path nào đi quanh một đường tròn đều là cùng một điểm, có vô số đường tròn có thể được chọn, và path thực tế là không xác định. Có thể xấp xỉ chúng bằng cách làm cho các điểm bắt đầu và kết thúc của path lệch nhẹ, rồi nối chúng bằng một đoạn path khác. Ví dụ, có thể tạo một hình tròn bằng một arc cho mỗi nửa hình tròn. Tới lúc đó, thường dễ hơn nếu dùng một nút {{SVGElement("circle")}} hoặc {{SVGElement("ellipse")}} thực sự. Demo tương tác này có thể giúp bạn hiểu các khái niệm đằng sau arc SVG.

```html hidden live-sample___arcs_interactive
<script src="https://cdn.jsdelivr.net/gh/lingtalfi/simpledrag@2.2.0/simpledrag.js"></script>
<div class="ui">
  <div class="controls">
    Radius X: <input id="rx" type="range" min="0" max="500" /><br />
    Radius Y: <input id="ry" type="range" min="0" max="500" /><br />
    Rotation:
    <input id="rot" type="range" min="0" max="360" value="0" /><br />
    Large arc flag: <input id="laf" type="checkbox" /><br />
    Sweep flag: <input id="sf" type="checkbox" /><br />
    Arc command: <span id="arc-value"></span><br />
  </div>
  <div class="results">
    mouse: pageX <span id="page-x"></span>, pageY <span id="page-y"></span
    ><br />
    A: <span id="ax-value"></span>, <span id="ay-value"></span><br />
    B: <span id="bx-value"></span>, <span id="by-value"></span><br />
    m: <span id="m-value"></span><br />
    b(A): <span id="ba-value"></span><br />
    b(B): <span id="bb-value"></span><br />
    contextWidth: <span id="cw-value"></span><br />
  </div>
</div>

<svg width="100%" height="100%" id="svg-context">
  <path id="arc2" d="" fill="none" stroke="green" stroke-width="2"></path>
  <path id="arc3" d="" fill="none" stroke="green" stroke-width="2"></path>
  <path id="arc4" d="" fill="none" stroke="green" stroke-width="2"></path>

  <path
    id="arc"
    d="M100 100 A 100 100 0 1 0 200 100"
    fill="none"
    stroke="red"
    stroke-width="4"></path>

  <line
    id="line0"
    x1="0"
    y1="0"
    x2="0"
    y2="0"
    fill="none"
    stroke="black"
    stroke-width="2"></line>
  <line
    id="line"
    x1="0"
    y1="0"
    x2="0"
    y2="0"
    fill="none"
    stroke="black"
    stroke-width="2"></line>
  <line
    id="line2"
    x1="0"
    y1="0"
    x2="0"
    y2="0"
    fill="none"
    stroke="black"
    stroke-width="2"></line>

  <circle
    id="circle1"
    cx="100"
    cy="100"
    r="5"
    fill="red"
    stroke="red"
    stroke-width="2"></circle>

  <circle
    id="circle2"
    cx="200"
    cy="100"
    r="5"
    fill="red"
    stroke="red"
    stroke-width="2"></circle>
</svg>
```

```css hidden live-sample___arcs_interactive
body {
  position: fixed;
  width: 100%;
  height: 100%;
  background: #eeeeee;
}

.ui {
  display: flex;
}

.ui > div {
  margin: 0 10px;
}

.ui .controls input {
  vertical-align: middle;
}

#circle1,
#circle2 {
  cursor: pointer;
}

svg {
  background: #dddddd;
}
```

```js hidden live-sample___arcs_interactive
const svgContext = document.getElementById("svg-context");
let rect = svgContext.getBoundingClientRect(); // helper to enclose mouse coordinates into svg box

const pageXEl = document.getElementById("page-x");
const pageYEl = document.getElementById("page-y");
const mEl = document.getElementById("m-value");
const rxEl = document.getElementById("rx");
const ryEl = document.getElementById("ry");
const rotEl = document.getElementById("rot");
const lafEl = document.getElementById("laf");
const sfEl = document.getElementById("sf");
const axEl = document.getElementById("ax-value");
const ayEl = document.getElementById("ay-value");
const bxEl = document.getElementById("bx-value");
const byEl = document.getElementById("by-value");
const baEl = document.getElementById("ba-value");
const bbEl = document.getElementById("bb-value");
const circle1 = document.getElementById("circle1");
const circle2 = document.getElementById("circle2");
const line = document.getElementById("line");
const line0 = document.getElementById("line0");
const line2 = document.getElementById("line2");
const cwEl = document.getElementById("cw-value");
const arcCmdEl = document.getElementById("arc-value");
const arcEl = document.getElementById("arc");
const arc2El = document.getElementById("arc2");
const arc3El = document.getElementById("arc3");
const arc4El = document.getElementById("arc4");

function updatePaths(pageX, pageY) {
  pageXEl.textContent = pageX;
  pageYEl.textContent = pageY;

  // line between two points
  line.setAttribute("x1", circle1.getAttribute("cx"));
  line.setAttribute("y1", circle1.getAttribute("cy"));
  line.setAttribute("x2", circle2.getAttribute("cx"));
  line.setAttribute("y2", circle2.getAttribute("cy"));

  axEl.textContent = circle1.getAttribute("cx");
  ayEl.textContent = circle1.getAttribute("cy");
  bxEl.textContent = circle2.getAttribute("cx");
  byEl.textContent = circle2.getAttribute("cy");

  // y = mx + b
  let m, b, run; // m = rise/run = (y2-y1) / (x2-x1)
  if (circle1.getAttribute("cx") <= circle2.getAttribute("cx")) {
    run = circle2.getAttribute("cx") - circle1.getAttribute("cx");
    if (run !== 0) {
      m = (circle2.getAttribute("cy") - circle1.getAttribute("cy")) / run;
    }
  } else {
    run = circle1.getAttribute("cx") - circle2.getAttribute("cx");
    if (run !== 0) {
      m = (circle1.getAttribute("cy") - circle2.getAttribute("cy")) / run;
    }
  }

  if (run !== 0) {
    // b = y - mx
    b = circle1.getAttribute("cy") - m * circle1.getAttribute("cx");
    b2 = circle2.getAttribute("cy") - m * circle2.getAttribute("cx");
    baEl.textContent = b;
    bbEl.textContent = b2;
    mEl.textContent = m;

    // draw segment from the left vertical axis (x=0) to the left most point (A or B).
    // x=0 ----> y = b
    let leftMost, rightMost;
    if (circle1.getAttribute("cx") <= circle2.getAttribute("cx")) {
      leftMost = circle1;
      rightMost = circle2;
    } else {
      leftMost = circle2;
      rightMost = circle1;
    }

    line0.setAttribute("x1", 0);
    line0.setAttribute("y1", b);
    line0.setAttribute("x2", leftMost.getAttribute("cx"));
    line0.setAttribute("y2", leftMost.getAttribute("cy"));

    // draw segment from point B to the right vertical axis (x=rect.width)
    // representing the end of the svg box.
    // y = mx + b
    const y = m * rect.width + b;
    line2.setAttribute("x1", rightMost.getAttribute("cx"));
    line2.setAttribute("y1", rightMost.getAttribute("cy"));
    line2.setAttribute("x2", rect.width);
    line2.setAttribute("y2", y);

    // now update the arc
    const arcCmd = getArcCommand(
      leftMost,
      rightMost,
      lafEl.checked,
      sfEl.checked,
    );
    arcCmdEl.textContent = arcCmd;
    arcEl.setAttribute("d", arcCmd);

    // now update the other helper arcs
    const combo = [
      [true, true],
      [true, false],
      [false, true],
      [false, false],
    ].filter(
      (item) => !(item[0] === lafEl.checked && item[1] === sfEl.checked),
    );
    arc2El.setAttribute(
      "d",
      getArcCommand(leftMost, rightMost, combo[0][0], combo[0][1]),
    );
    arc3El.setAttribute(
      "d",
      getArcCommand(leftMost, rightMost, combo[1][0], combo[1][1]),
    );
    arc4El.setAttribute(
      "d",
      getArcCommand(leftMost, rightMost, combo[2][0], combo[2][1]),
    );
  }
}

function getArcCommand(leftMost, rightMost, lafChecked, sfChecked) {
  return `M${leftMost.getAttribute("cx")} ${leftMost.getAttribute("cy")} A ${rxEl.value} ${ryEl.value} ${rotEl.value} ${lafChecked ? "1" : "0"} ${sfChecked ? "1" : "0"} ${rightMost.getAttribute("cx")} ${rightMost.getAttribute("cy")}`;
}

function updateScreen() {
  rect = svgContext.getBoundingClientRect();
  cwEl.textContent = rect.width;
}

circle1.sdrag((el, pageX, startX, pageY, startY) => {
  pageX -= rect.left;
  pageY -= rect.top;

  el.setAttribute("cx", pageX);
  el.setAttribute("cy", pageY);
  updatePaths(pageX, pageY);
});

circle2.sdrag((el, pageX, startX, pageY, startY) => {
  pageX -= rect.left;
  pageY -= rect.top;

  el.setAttribute("cx", pageX);
  el.setAttribute("cy", pageY);
  updatePaths(pageX, pageY);
});

window.addEventListener("resize", updateScreen);

// sliders
["rx", "ry", "rot"].forEach((id) => {
  document.getElementById(id).addEventListener("input", (e) => {
    updatePaths();
  });
});

// checkboxes
["laf", "sf"].forEach((id) => {
  document.getElementById(id).addEventListener("change", (e) => {
    updatePaths();
  });
});

updatePaths();
updateScreen();
```

{{EmbedLiveSample("arcs_interactive", "", 600)}}

{{ PreviousNext("Web/SVG/Tutorials/SVG_from_scratch/Basic_shapes", "Web/SVG/Tutorials/SVG_from_scratch/Fills_and_strokes") }}
