---
title: "ARIA: thuộc tính aria-busy"
short-title: aria-busy
slug: Web/Accessibility/ARIA/Reference/Attributes/aria-busy
page-type: aria-attribute
spec-urls: https://w3c.github.io/aria/#aria-busy
sidebar: accessibilitysidebar
---

Thuộc tính `aria-busy` là một trạng thái ARIA toàn cục cho biết một phần tử hiện có đang được sửa đổi hay không. Nó giúp công nghệ hỗ trợ hiểu rằng các thay đổi đối với nội dung vẫn chưa hoàn tất, và rằng chúng có thể nên chờ trước khi thông báo bản cập nhật cho người dùng. Mặc dù `aria-busy` thường được dùng trong [vùng trực tiếp ARIA](/en-US/docs/Web/Accessibility/ARIA/Guides/Live_regions) để trì hoãn thông báo cho đến khi bản cập nhật hoàn tất, nó cũng có thể được dùng bên ngoài vùng trực tiếp - ví dụ trong widget hoặc feed - để báo hiệu các thay đổi hoặc tải đang diễn ra.

Khi nhiều phần của một vùng trực tiếp cần được tải trước khi thông báo các thay đổi cho người dùng, hãy đặt `aria-busy="true"` cho đến khi việc tải hoàn tất. Sau đó đặt thành `aria-busy="false"`. Điều này ngăn công nghệ hỗ trợ thông báo các thay đổi trước khi bản cập nhật hoàn tất.

## Mô tả

Có một phần nội dung đang được cập nhật. Các bản cập nhật này quan trọng và bạn muốn cho người dùng biết khi nội dung đã được sửa đổi, nên bạn đã chuyển nó thành một [vùng trực tiếp ARIA](/en-US/docs/Web/Accessibility/ARIA/Guides/Live_regions) bằng thuộc tính [`aria-live`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-live). Bạn có thể muốn cập nhật đồng thời nhiều thành phần của phần đó, nhưng không thể chắc rằng mọi thứ sẽ cập nhật cùng lúc. Ngay cả khi đó là một vùng trực tiếp rất quan trọng với `aria-live="assertive"`, bạn cũng không muốn làm gián đoạn người dùng nhiều lần khi các phần khác nhau của nội dung được tải. Đây là lúc `aria-busy` có thể giúp.

Thuộc tính `aria-busy` là một thuộc tính tùy chọn của các vùng trực tiếp có thể mang giá trị `true` hoặc `false`. Thuộc tính `aria-busy` với giá trị `true` có thể được thêm vào phần tử hiện đang được cập nhật hoặc sửa đổi để báo cho công nghệ hỗ trợ rằng nó nên chờ cho đến khi các sửa đổi hoặc thay đổi hoàn tất rồi mới hiển thị nội dung cho người dùng. Hãy dùng thuộc tính [`ariaBusy`](/en-US/docs/Web/API/Element/ariaBusy) của đối tượng để đổi giá trị thành `false` khi việc tải xuống hoàn tất.

```js
ariaLiveElement.ariaBusy = "false";
```

Giá trị của [`aria-live`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-live) quyết định việc các thay đổi có được thông báo ngay khi giá trị đổi thành `false` hay không, hoặc công nghệ hỗ trợ chờ cho đến khi tác vụ hiện tại hoàn tất trước khi làm gián đoạn người dùng.

### Trong `feed`

Nếu một phần tử có vai trò [`feed`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/feed_role) được đặt `aria-busy` thành `true`, các thay đổi hiển thị xảy ra bên trong feed sẽ không được thông báo, ngoại trừ các thay đổi do người dùng khởi tạo.

### Trong `widget`

Nếu các thay đổi đối với một widget đã render sẽ tạo ra trạng thái mà widget thiếu các phần tử con bắt buộc trong khi script đang thực thi, hãy đặt `aria-busy` thành `true` trên widget trong quá trình cập nhật. Ví dụ, nếu một treegrid đã render cập nhật nhiều nhánh mà không nhất thiết được render cùng lúc, một cách khác thay vì thay thế toàn bộ cây trong một lần cập nhật là đánh dấu cây đang bận trong khi từng nhánh được sửa đổi.

## Giá trị

- false (mặc định):
  - : Không có bản cập nhật nào được mong đợi cho phần tử.
- true
  - : Phần tử đang được cập nhật.

## Giao diện liên quan

- {{domxref("Element.ariaBusy")}}
  - : Thuộc tính [`ariaBusy`](/en-US/docs/Web/API/Element/ariaBusy), là một phần của giao diện của mỗi phần tử, phản ánh giá trị của thuộc tính `aria-busy`, vốn cho biết một phần tử đang được sửa đổi.

```html
<div
  id="clock"
  role="timer"
  aria-live="polite"
  aria-atomic="true"
  aria-busy="false"></div>
```

```js
const el = document.getElementById("clock");
console.log(el.ariaBusy); // false
el.ariaBusy = "true";
console.log(el.ariaBusy); // true
```

## Vai trò liên quan

Được dùng trong **TẤT CẢ** vai trò

## Đặc tả

{{Specifications}}

## Xem thêm

- [Vùng trực tiếp ARIA](/en-US/docs/Web/Accessibility/ARIA/Guides/Live_regions)
- [`aria-live`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-live)
- [`aria-relevant`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-relevant)
- [`aria-atomic`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-atomic)
