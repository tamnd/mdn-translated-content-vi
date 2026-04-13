---
title: ResizeObserver
slug: Web/API/ResizeObserver
page-type: web-api-interface
browser-compat: api.ResizeObserver
---

{{APIRef("Resize Observer API")}}

Giao diện **`ResizeObserver`** báo cáo các thay đổi về kích thước của content box hoặc border box của một {{domxref('Element')}}, hoặc bounding box của một {{domxref('SVGElement')}}.

> [!NOTE]
> Content box là hộp chứa nội dung có thể được đặt vào, tức là border box trừ đi phần padding và độ dày viền. Border box bao gồm nội dung, padding và viền. Xem [Mô hình hộp](/en-US/docs/Learn_web_development/Core/Styling_basics/Box_model) để biết thêm giải thích.

## Hàm tạo

- {{domxref("ResizeObserver.ResizeObserver", "ResizeObserver()")}}
  - : Tạo và trả về một đối tượng `ResizeObserver` mới.

## Thuộc tính thể hiện

Không có.

## Phương thức thể hiện

- {{domxref('ResizeObserver.disconnect()')}}
  - : Ngừng theo dõi tất cả các mục tiêu {{domxref('Element')}} đang được quan sát của một observer cụ thể.
- {{domxref('ResizeObserver.observe()')}}
  - : Bắt đầu theo dõi một {{domxref('Element')}} được chỉ định.
- {{domxref('ResizeObserver.unobserve()')}}
  - : Kết thúc việc theo dõi một {{domxref('Element')}} được chỉ định.

## Ví dụ

Trong ví dụ [resize-observer-text.html](https://mdn.github.io/dom-examples/resize-observer/resize-observer-text.html) ([xem mã nguồn](https://github.com/mdn/dom-examples/blob/main/resize-observer/resize-observer-text.html)), chúng ta dùng resize observer để thay đổi {{cssxref("font-size")}} của một tiêu đề và một đoạn văn khi giá trị của thanh trượt thay đổi, khiến `<div>` chứa chúng đổi chiều rộng. Điều này cho thấy bạn có thể phản hồi các thay đổi về kích thước của một phần tử, ngay cả khi chúng không liên quan gì đến viewport.

Chúng ta cũng cung cấp một hộp kiểm để tắt và bật observer. Nếu nó bị tắt, văn bản sẽ không thay đổi khi chiều rộng của `<div>` thay đổi.

Mã JavaScript trông như sau:

```js
const h1Elem = document.querySelector("h1");
const pElem = document.querySelector("p");
const divElem = document.querySelector("body > div");
const slider = document.querySelector('input[type="range"]');
const checkbox = document.querySelector('input[type="checkbox"]');

divElem.style.width = "600px";

slider.addEventListener("input", () => {
  divElem.style.width = `${slider.value}px`;
});

const resizeObserver = new ResizeObserver((entries) => {
  for (const entry of entries) {
    if (entry.contentBoxSize) {
      const contentBoxSize = entry.contentBoxSize[0];
      h1Elem.style.fontSize = `${Math.max(
        1.5,
        contentBoxSize.inlineSize / 200,
      )}rem`;
      pElem.style.fontSize = `${Math.max(
        1,
        contentBoxSize.inlineSize / 600,
      )}rem`;
    } else {
      h1Elem.style.fontSize = `${Math.max(
        1.5,
        entry.contentRect.width / 200,
      )}rem`;
      pElem.style.fontSize = `${Math.max(1, entry.contentRect.width / 600)}rem`;
    }
  }

  console.log("Kích thước đã thay đổi");
});

resizeObserver.observe(divElem);

checkbox.addEventListener("change", () => {
  if (checkbox.checked) {
    resizeObserver.observe(divElem);
  } else {
    resizeObserver.unobserve(divElem);
  }
});
```

## Lỗi quan sát

Các triển khai tuân theo đặc tả sẽ kích hoạt sự kiện resize trước khi vẽ (nghĩa là trước khi khung hình được hiển thị cho người dùng). Nếu có bất kỳ sự kiện resize nào, style và layout sẽ được đánh giá lại - điều đó lần lượt có thể kích hoạt thêm các sự kiện resize. Vòng lặp vô hạn do phụ thuộc vòng được xử lý bằng cách chỉ xử lý các phần tử có độ sâu lớn hơn trong DOM ở mỗi vòng lặp. Các sự kiện resize không thỏa điều kiện đó sẽ bị hoãn sang lần vẽ tiếp theo, và một sự kiện lỗi sẽ được phát trên đối tượng {{domxref('Window')}}, với chuỗi thông báo đã được xác định rõ:

**ResizeObserver loop completed with undelivered notifications.**

Lưu ý rằng điều này chỉ ngăn trình duyệt bị treo, chứ không ngăn chính vòng lặp vô hạn. Ví dụ, đoạn mã sau sẽ làm chiều rộng của `divElem` tăng mãi, và thông báo lỗi ở trên sẽ lặp lại trong console mỗi khung hình:

```js
const divElem = document.querySelector("body > div");

const resizeObserver = new ResizeObserver((entries) => {
  for (const entry of entries) {
    entry.target.style.width = `${entry.contentBoxSize[0].inlineSize + 10}px`;
  }
});

resizeObserver.observe(divElem);

window.addEventListener("error", (e) => {
  console.error(e.message);
});
```

Miễn là sự kiện lỗi không phát ra liên tục, resize observer sẽ ổn định và tạo ra một bố cục ổn định, có lẽ là chính xác. Tuy nhiên, người dùng có thể thấy bố cục bị nhấp nháy, vì một chuỗi thay đổi đáng lẽ xảy ra trong một khung hình lại diễn ra qua nhiều khung hình.

Nếu bạn muốn ngăn các lỗi này, giải pháp sẽ phụ thuộc vào hiệu ứng bạn thực sự muốn. Nếu bạn thực sự dự định tạo một vòng lặp vô hạn, bạn chỉ cần trì hoãn mã thay đổi kích thước trong callback `ResizeObserver` sang sau khi trình duyệt repaint. Bạn có thể đặt nó vào một callback [`requestAnimationFrame`](/en-US/docs/Web/API/Window/requestAnimationFrame).

```js
const divElem = document.querySelector("body > div");

const resizeObserver = new ResizeObserver((entries) => {
  requestAnimationFrame(() => {
    for (const entry of entries) {
      entry.target.style.width = `${entry.contentBoxSize[0].inlineSize + 10}px`;
    }
  });
});

resizeObserver.observe(divElem);

window.addEventListener("error", (e) => {
  console.error(e.message);
});
```

Nếu bạn không có ý định tạo vòng lặp vô hạn, bạn nên bảo đảm mã thay đổi kích thước của mình không kích hoạt callback của resize observer. Có nhiều cách để làm điều này, chẳng hạn như đặt một "kích thước dự kiến" và không đổi kích thước nếu kích thước đã ở đúng giá trị đó.

```js
const divElem = document.querySelector("body > div");
const expectedSizes = new WeakMap();

const resizeObserver = new ResizeObserver((entries) => {
  requestAnimationFrame(() => {
    for (const entry of entries) {
      const expectedSize = expectedSizes.get(entry.target);
      if (entry.contentBoxSize[0].inlineSize === expectedSize) {
        continue;
      }
      const newSize = entry.contentBoxSize[0].inlineSize + 10;
      entry.target.style.width = `${newSize}px`;
      expectedSizes.set(entry.target, newSize);
    }
  });
});

resizeObserver.observe(divElem);

window.addEventListener("error", (e) => {
  console.error(e.message);
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Học: Mô hình hộp](/en-US/docs/Learn_web_development/Core/Styling_basics/Box_model)
- {{domxref('PerformanceObserver')}}
- {{domxref('IntersectionObserver')}} (một phần của [Intersection Observer API](/en-US/docs/Web/API/Intersection_Observer_API))
- Các [container queries](/en-US/docs/Web/CSS/Guides/Containment/Container_queries) sắp tới có thể là một lựa chọn thay thế khả thi để triển khai thiết kế đáp ứng.
