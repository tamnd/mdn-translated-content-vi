---
title: "ARIA: thuộc tính aria-relevant"
short-title: aria-relevant
slug: Web/Accessibility/ARIA/Reference/Attributes/aria-relevant
page-type: aria-attribute
spec-urls: https://w3c.github.io/aria/#aria-relevant
sidebar: accessibilitysidebar
---

Dùng trong các live region ARIA, thuộc tính toàn cục `aria-relevant` cho biết user agent sẽ kích hoạt những thông báo nào khi [cây trợ năng](/en-US/docs/Glossary/Accessibility_tree) bên trong live region bị thay đổi.

## Mô tả

[ARIA live regions](/en-US/docs/Web/Accessibility/ARIA/Guides/Live_regions) là những khu vực của trang web được cập nhật khi sự chú ý của người dùng có thể đang ở nơi khác. Khi một cập nhật xảy ra ngoài focus bàn phím của người dùng, các công nghệ hỗ trợ như bộ đọc màn hình sẽ dùng live region để thông báo cập nhật cho người dùng.

Các ví dụ về live region gồm bảng tin chạy chữ, ticker chứng khoán, cửa sổ chat và bảng điểm. Chúng được cập nhật mà không cần tương tác của người dùng. Một số cập nhật là quan trọng đối với người dùng, còn những cập nhật khác thì không. `aria-relevant` được dùng để mô tả những loại thay đổi nào đã xảy ra trong một vùng [`aria-live`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-live) và những thay đổi nào có liên quan nên được thông báo.

Giá trị là danh sách các loại thay đổi được phân tách bằng dấu cách, gồm `additions`, `removals` và `text`, với dạng rút gọn `all` nghĩa là cả ba.

Khi `aria-relevant` không được định nghĩa, giá trị sẽ được kế thừa từ phần tử tổ tiên gần nhất có giá trị đã định nghĩa. Các giá trị kế thừa không cộng dồn; giá trị được cung cấp trên phần tử con sẽ ghi đè hoàn toàn mọi giá trị kế thừa từ phần tử tổ tiên. Khi một live region không có thuộc tính `aria-relevant` và cũng không có tổ tiên nào đặt nó, giá trị mặc định là `additions text`, nghĩa là các nút phần tử được thêm vào cây trợ năng bên trong live region, VÀ nội dung văn bản hoặc văn bản thay thế được thêm vào bất kỳ phần tử con nào trong cây trợ năng của live region. Lý do là vì nhìn chung việc thay đổi văn bản và thêm nút là có liên quan, còn xóa nút thì không.

Mặc dù `none` không phải là giá trị được hỗ trợ, nếu giá trị này là hợp lý nhất thì lẽ ra phần tử đó không nên là live region.

Các giá trị `removals` và `all` nên được dùng tiết chế. Ví dụ, khi có bàn thắng trong World Cup, tỉ số mới (phần thêm vào) là quan trọng, còn giá trị cũ (phần bị xóa) thì không. Công nghệ hỗ trợ chỉ cần được thông báo về việc xóa nội dung khi việc xóa đó biểu thị một thay đổi quan trọng, chẳng hạn khi một cầu thủ bị rút khỏi trận đấu.

## Giá trị

- `additions`
  - : Các nút phần tử được thêm vào cây trợ năng bên trong live region.
- `all`
  - : Dạng rút gọn của `additions removals text`.
- `removals`
  - : Nội dung văn bản, văn bản thay thế hoặc một nút phần tử bên trong live region bị xóa khỏi cây trợ năng.
- `text`
  - : Nội dung văn bản hoặc văn bản thay thế được thêm vào bất kỳ hậu duệ nào trong cây trợ năng của live region.

## Giao diện liên quan

- {{domxref("Element.ariaRelevant")}}
  - : Thuộc tính [`ariaRelevant`](/en-US/docs/Web/API/Element/ariaRelevant), thuộc giao diện {{domxref("Element")}}, phản ánh giá trị của thuộc tính `aria-relevant`.
- {{domxref("ElementInternals.ariaRelevant")}}
  - : Thuộc tính [`ariaRelevant`](/en-US/docs/Web/API/ElementInternals/ariaRelevant), thuộc giao diện {{domxref("ElementInternals")}}, phản ánh giá trị của thuộc tính `aria-relevant`.

## Vai trò liên quan

Được dùng trong **TẤT CẢ** các vai trò.

## Thông số kỹ thuật

{{Specifications}}

## Xem thêm

- [`aria-atomic`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-atomic)
- [`aria-live`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-live)
- [`aria-busy`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-busy)
- [ARIA live regions](/en-US/docs/Web/Accessibility/ARIA/Guides/Live_regions)
