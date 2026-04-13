---
title: HTMLOptionElement
slug: Web/API/HTMLOptionElement
page-type: web-api-interface
browser-compat: api.HTMLOptionElement
---

{{APIRef("HTML DOM")}}

Giao diện **`HTMLOptionElement`** đại diện cho các phần tử {{HTMLElement("option")}} và kế thừa tất cả các thuộc tính và phương thức của giao diện {{domxref("HTMLElement")}}.

{{InheritanceDiagram}}

## Hàm khởi tạo

- {{domxref("HTMLOptionElement.Option", "Option()")}}
  - : Trả về một đối tượng `HTMLOptionElement` mới được tạo. Nó có bốn tham số: văn bản hiển thị `text`, giá trị liên kết `value`, giá trị của `defaultSelected` và giá trị của `selected`. Ba tham số cuối là tùy chọn.

## Thuộc tính phiên bản

_Kế thừa các thuộc tính từ phần tử cha, {{domxref("HTMLElement")}}._

- {{domxref("HTMLOptionElement.defaultSelected")}}
  - : Có giá trị `true` hoặc `false` cho biết giá trị ban đầu của thuộc tính HTML [`selected`](/en-US/docs/Web/HTML/Reference/Elements/option#selected), xác định liệu tùy chọn có được chọn mặc định hay không.
- {{domxref("HTMLOptionElement.disabled")}}
  - : Có giá trị `true` hoặc `false` đại diện cho giá trị của thuộc tính HTML [`disabled`](/en-US/docs/Web/HTML/Reference/Elements/option#disabled), cho biết tùy chọn không thể được chọn.
- {{domxref("HTMLOptionElement.form")}} {{ReadOnlyInline}}
  - : Một {{domxref("HTMLFormElement")}} đại diện cho cùng giá trị với `form` của phần tử {{HTMLElement("select")}} tương ứng, nếu tùy chọn là con của phần tử {{HTMLElement("select")}} nằm trong biểu mẫu, hoặc `null` nếu không tìm thấy.
- {{domxref("HTMLOptionElement.index")}} {{ReadOnlyInline}}
  - : Một `long` đại diện cho vị trí của tùy chọn trong danh sách tùy chọn mà nó thuộc về, theo thứ tự cây. Nếu tùy chọn không thuộc danh sách tùy chọn nào, chẳng hạn khi nó là một phần của phần tử {{HTMLElement("datalist")}}, giá trị là `0`.
- {{domxref("HTMLOptionElement.label")}}
  - : Một chuỗi phản ánh giá trị của thuộc tính HTML [`label`](/en-US/docs/Web/HTML/Reference/Elements/option#label), cung cấp nhãn cho tùy chọn. Nếu thuộc tính này không được đặt cụ thể, đọc nó sẽ trả về nội dung {{domxref("HTMLOptionElement.text", "text")}} của phần tử.
- {{domxref("HTMLOptionElement.selected")}}
  - : Có giá trị `true` hoặc `false` cho biết liệu tùy chọn hiện có được chọn hay không.
- {{domxref("HTMLOptionElement.text")}}
  - : Một chuỗi chứa nội dung văn bản của phần tử.
- {{domxref("HTMLOptionElement.value")}}
  - : Một chuỗi phản ánh giá trị của thuộc tính HTML [`value`](/en-US/docs/Web/HTML/Reference/Elements/option#value) nếu tồn tại; ngược lại phản ánh giá trị của thuộc tính {{domxref("Node.textContent")}}.

## Phương thức phiên bản

_Không triển khai bất kỳ phương thức cụ thể nào, nhưng kế thừa các phương thức từ phần tử cha, {{domxref("HTMLElement")}}._

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{HTMLElement("option")}}
- {{HTMLElement("select")}}
- {{HTMLElement("datalist")}}
- {{HTMLElement("optgroup")}}
- {{domxref("HTMLOptionsCollection")}}
- {{domxref("HTMLSelectElement")}}
- {{domxref("HTMLOptGroupElement")}}
- {{domxref("HTMLElement")}}
- {{domxref("HTMLCollection")}}
