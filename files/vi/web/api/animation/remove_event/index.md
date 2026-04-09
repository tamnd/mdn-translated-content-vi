---
title: "Animation: sự kiện remove"
short-title: remove
slug: Web/API/Animation/remove_event
page-type: web-api-event
browser-compat: api.Animation.remove_event
---

{{ APIRef("Web Animations") }}

Sự kiện **`remove`** của giao diện {{domxref("Animation")}} kích hoạt khi hoạt ảnh bị trình duyệt [tự động loại bỏ](/en-US/docs/Web/API/Web_Animations_API/Using_the_Web_Animations_API#automatically_removing_filling_animations).

## Cú pháp

Dùng tên sự kiện trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}}, hoặc đặt một thuộc tính trình xử lý sự kiện.

```js-nolint
addEventListener("remove", (event) => { })

onremove = (event) => { }
```

## Kiểu sự kiện

Một {{domxref("AnimationPlaybackEvent")}}. Kế thừa từ {{domxref("Event")}}.

{{InheritanceDiagram("AnimationPlaybackEvent")}}

## Thuộc tính sự kiện

_Ngoài các thuộc tính được liệt kê dưới đây, các thuộc tính từ giao diện cha {{domxref("Event")}} cũng khả dụng._

- {{domxref("AnimationPlaybackEvent.currentTime")}} {{ReadOnlyInline}}
  - : Thời gian hiện tại của hoạt ảnh đã tạo ra sự kiện.
- {{domxref("AnimationPlaybackEvent.timelineTime")}} {{ReadOnlyInline}}
  - : Giá trị thời gian của timeline của hoạt ảnh đã tạo ra sự kiện.

## Ví dụ

### Loại bỏ các hoạt ảnh bị thay thế

Trong ví dụ này chúng ta có một phần tử `<button id="start">` và một trình lắng nghe sự kiện chạy mỗi khi chuột di chuyển. Trình xử lý sự kiện {{domxref("Element.mousemove_event","mousemove")}} thiết lập một hoạt ảnh đưa `<button>` tới vị trí của con trỏ chuột. Điều này có thể dẫn tới một danh sách hoạt ảnh rất lớn, gây rò rỉ bộ nhớ. Vì lý do đó, các trình duyệt hiện đại tự động loại bỏ các hoạt ảnh điền tiến (`forwards-filling`) bị ghi đè bởi các hoạt ảnh khác.

Số lượng hoạt ảnh được tạo ra được hiển thị. Một trình lắng nghe sự kiện `remove` cũng được dùng để đếm và hiển thị số hoạt ảnh đã bị loại bỏ.

Cuối cùng, tất cả trừ một hoạt ảnh sẽ bị loại bỏ.

#### HTML

```html
<button id="start">Click to drag</button>
<br />
<button id="reset">Reset example</button>
<p>
  Click the button to start the animation (disabled by default to protect those
  who suffer migraines when experiencing such animations).
</p>
<p>Animations created: <span id="count-created">0</span></p>
<p>Animations removed: <span id="count-removed">0</span></p>
```

#### CSS

```css
:root,
body {
  margin: 0;
  padding: 0;
  height: 100%;
}

button {
  margin: 0.5rem 0;
}
```

#### JavaScript

```js
const button = document.querySelector("#start");
let created = 0;
let removed = 0;

button.addEventListener(
  "click",
  () => {
    document.body.addEventListener("mousemove", (event) => {
      const animation = button.animate(
        { transform: `translate(${event.clientX}px, ${event.clientY}px)` },
        { duration: 500, fill: "forwards" },
      );
      created++;
      showCounts();

      // the remove event fires after the animation is removed
      animation.addEventListener("remove", () => {
        removed++;
        showCounts();
      });
    });
  },
  { once: true },
);

function showCounts() {
  document.getElementById("count-created").textContent = created;
  document.getElementById("count-removed").textContent = removed;
}

const reset = document.querySelector("#reset");
reset.addEventListener("click", () => {
  document.location.reload();
});
```

#### Kết quả

{{embedlivesample("Removing_replaced_animations","",250)}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Web Animations API](/en-US/docs/Web/API/Web_Animations_API)
- {{domxref("Animation")}}, {{domxref("AnimationPlaybackEvent")}}
- {{domxref("Animation.replaceState")}}, để kiểm tra xem hoạt ảnh đã bị loại bỏ hay chưa
- {{domxref("Animation.persist()")}}, để ngăn hoạt ảnh bị loại bỏ
