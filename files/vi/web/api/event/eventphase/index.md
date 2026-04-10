---
title: "Event: thuộc tính eventPhase"
short-title: eventPhase
slug: Web/API/Event/eventPhase
page-type: web-api-instance-property
browser-compat: api.Event.eventPhase
---

{{APIRef("DOM")}}{{AvailableInWorkers}}

Thuộc tính chỉ đọc **`eventPhase`** của giao diện {{domxref("Event")}} cho biết pha nào của luồng sự kiện hiện đang được đánh giá.

## Giá trị

Trả về một giá trị số nguyên chỉ định pha đánh giá hiện tại của luồng sự kiện. Các giá trị có thể là:

- `Event.NONE` (0)
  - : Sự kiện hiện không được xử lý.
- `Event.CAPTURING_PHASE` (1)
  - : Sự kiện đang được lan truyền qua các đối tượng tổ tiên của đích.
    Quá trình này bắt đầu với {{domxref("Window")}}, rồi đến {{domxref("Document")}},
    rồi đến {{domxref("HTMLHtmlElement")}}, và tiếp tục qua các phần tử
    cho đến khi tới cha của đích.
    Các {{domxref("EventTarget/addEventListener", "bộ lắng nghe sự kiện", "", 1)}} được đăng ký ở chế độ capture khi {{domxref("EventTarget.addEventListener()")}} được gọi sẽ được kích hoạt trong pha này.
- `Event.AT_TARGET` (2)
  - : Sự kiện đã tới {{domxref("EventTarget", "đích của sự kiện", "", 1)}}.
    Các bộ lắng nghe sự kiện được đăng ký cho pha này sẽ được gọi vào thời điểm này. Nếu
    {{domxref("Event.bubbles")}} là `false`, việc xử lý
    sự kiện sẽ kết thúc sau khi pha này hoàn tất.
- `Event.BUBBLING_PHASE` (3)
  - : Sự kiện đang lan truyền ngược lên qua các tổ tiên của đích theo thứ tự đảo ngược,
    bắt đầu từ cha, rồi cuối cùng tới {{domxref("Window")}} chứa.
    Điều này được gọi là _bubbling_, và chỉ xảy ra nếu {{domxref("Event.bubbles")}} là
    `true`. Các {{domxref("EventTarget/addEventListener", "bộ lắng nghe sự kiện", "", 1)}} được đăng ký cho pha này sẽ được kích hoạt trong quá trình này.

## Ví dụ

### HTML

```html
<h4>Chuỗi lan truyền sự kiện</h4>
<ul>
  <li>Nhấp vào 'd1'</li>
  <li>Phân tích chuỗi lan truyền sự kiện</li>
  <li>Nhấp vào div tiếp theo và lặp lại</li>
  <li>Đổi sang chế độ capture</li>
  <li>Lặp lại trải nghiệm</li>
</ul>
<input type="checkbox" id="chCapture" />
<label for="chCapture">Dùng capture</label>
<div id="d1">
  d1
  <div id="d2">
    d2
    <div id="d3">
      d3
      <div id="d4">d4</div>
    </div>
  </div>
</div>
<div id="divInfo"></div>
```

### CSS

```css
div {
  margin: 20px;
  padding: 4px;
  border: thin black solid;
}

#divInfo {
  margin: 18px;
  padding: 8px;
  background-color: white;
  font-size: 80%;
}
```

### JavaScript

```js
let clear = false;
const divInfo = document.getElementById("divInfo");
const divs = document.getElementsByTagName("div");
const chCapture = document.getElementById("chCapture");

chCapture.addEventListener("click", () => {
  removeListeners();
  addListeners();
  clearDivs();
});
clearDivs();
addListeners();

function removeListeners() {
  for (const div of divs) {
    if (div.id !== "divInfo") {
      div.removeEventListener("click", onDivClick, true);
      div.removeEventListener("click", onDivClick, false);
    }
  }
}

function addListeners() {
  for (const div of divs) {
    if (div.id !== "divInfo") {
      if (chCapture.checked) {
        div.addEventListener("click", onDivClick, true);
      } else {
        div.addEventListener("click", onDivClick, false);
        div.onmousemove = () => {
          clear = true;
        };
      }
    }
  }
}

function onDivClick(e) {
  if (clear) {
    clearDivs();
    clear = false;
  }
  if (e.eventPhase === 2) {
    e.currentTarget.style.backgroundColor = "red";
  }
  const level =
    ["none", "capturing", "target", "bubbling"][e.eventPhase] ?? "error";
  const para = document.createElement("p");
  para.textContent = `${e.currentTarget.id}; eventPhase: ${level}`;
  divInfo.appendChild(para);
}

function clearDivs() {
  for (let i = 0; i < divs.length; i++) {
    if (divs[i].id !== "divInfo") {
      divs[i].style.backgroundColor = i % 2 !== 0 ? "#f6eedb" : "#cceeff";
    }
  }
  divInfo.textContent = "";
}
```

### Kết quả

{{ EmbedLiveSample('Example', '', '700') }}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
