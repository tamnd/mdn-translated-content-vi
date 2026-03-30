---
title: Void element
slug: Glossary/Void_element
page-type: glossary-definition
sidebar: glossarysidebar
---

**Phần tử rỗng** (void element) là một {{Glossary("element", "phần tử")}} trong HTML **không thể** có các nút con (tức là các phần tử lồng nhau hoặc nút văn bản). Phần tử rỗng chỉ có thẻ mở; thẻ đóng không được chỉ định cho các phần tử rỗng.

Trong HTML, phần tử rỗng không được có thẻ đóng. Ví dụ, `<input type="text"></input>` là HTML không hợp lệ. Ngược lại, các phần tử SVG hoặc MathML không thể có nút con nào có thể sử dụng thẻ đóng thay vì cú pháp tự đóng XML trong thẻ mở của chúng.

Các đặc tả [HTML](https://html.spec.whatwg.org/multipage/), [SVG](https://svgwg.org/svg2-draft/) và [MathML](https://w3c.github.io/mathml/spec.html) định nghĩa rất chính xác nội dung mà mỗi phần tử có thể chứa. Vì vậy, một số tổ hợp thẻ không có ý nghĩa ngữ nghĩa.

Mặc dù không có cách nào để đánh dấu một phần tử rỗng có bất kỳ nút con nào, các nút con vẫn có thể được thêm theo chương trình vào phần tử trong DOM bằng JavaScript. Nhưng đó không phải là thực hành tốt, vì kết quả sẽ không đáng tin cậy.

Các phần tử rỗng trong HTML bao gồm:

- {{HTMLElement("area")}}
- {{HTMLElement("base")}}
- {{HTMLElement("br")}}
- {{HTMLElement("col")}}
- {{HTMLElement("embed")}}
- {{HTMLElement("hr")}}
- {{HTMLElement("img")}}
- {{HTMLElement("input")}}
- {{HTMLElement("link")}}
- {{HTMLElement("meta")}}
- {{HTMLElement("param")}} {{deprecated_inline}}
- {{HTMLElement("source")}}
- {{HTMLElement("track")}}
- {{HTMLElement("wbr")}}

## Thẻ tự đóng

_Thẻ tự đóng (`<tag />`) không tồn tại trong HTML._

Nếu ký tự `/` (dấu gạch chéo) ở cuối xuất hiện trong thẻ mở của một phần tử HTML, trình phân tích HTML sẽ bỏ qua ký tự gạch chéo đó. Điều này đặc biệt quan trọng cần nhớ đối với các phần tử như {{HTMLElement('script')}} hoặc {{HTMLElement('ul')}} yêu cầu thẻ đóng. Trong những trường hợp này, việc thêm dấu gạch chéo ở cuối vào thẻ mở không đóng phần tử. Thay vào đó, dấu gạch chéo ở cuối bị bỏ qua và phần tử được coi là mở cho đến khi gặp thẻ đóng tường minh hoặc trình phân tích ngầm đóng phần tử dựa trên cấu trúc HTML và các quy tắc phân tích. Ví dụ, với `<div/>Some text`, trình duyệt diễn giải điều này là `<div>Some text</div>`, coi dấu gạch chéo bị bỏ qua và xem phần tử div bao gồm văn bản theo sau.

Tuy nhiên, một số công cụ định dạng mã thêm ký tự dấu gạch chéo ở cuối vào thẻ mở của các phần tử rỗng để làm cho chúng tương thích với XHTML và dễ đọc hơn. Ví dụ, một số công cụ định dạng mã sẽ chuyển đổi `<input type="text">` thành `<input type="text" />`.

Thẻ tự đóng là bắt buộc đối với phần tử rỗng trong {{Glossary("XML")}}, {{Glossary("XHTML")}} và {{Glossary("SVG")}} (ví dụ: `<circle cx="50" cy="50" r="50" />`).

Trong SVG và MathML, các phần tử không thể có nút con nào được phép đánh dấu là tự đóng. Trong những trường hợp này, nếu thẻ mở của phần tử được đánh dấu là tự đóng, phần tử không được có thẻ đóng.

> [!NOTE]
> Nếu ký tự `/` (dấu gạch chéo) ở cuối trong thẻ mở ngay liền trước giá trị thuộc tính không có dấu ngoặc kép — không có khoảng trắng giữa — dấu gạch chéo trở thành một phần của giá trị thuộc tính thay vì bị trình phân tích loại bỏ. Ví dụ, đánh dấu `<img src=http://www.example.com/logo.svg/>` dẫn đến thuộc tính `src` có giá trị `http://www.example.com/logo.svg/` — điều này làm cho URL sai.

## Xem thêm

- {{glossary("Replaced elements")}}
