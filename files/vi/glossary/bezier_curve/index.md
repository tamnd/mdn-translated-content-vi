---
title: Bézier curve
slug: Glossary/Bezier_curve
page-type: glossary-definition
sidebar: glossarysidebar
---

**Đường cong Bézier** (phát âm là \[bezje]) là một đường cong được mô tả về mặt toán học được sử dụng trong đồ họa máy tính và hoạt ảnh. Trong hình ảnh vector, chúng được dùng để mô hình hóa các đường cong mượt mà có thể được phóng to vô hạn.

Đường cong được xác định bởi một tập hợp các điểm kiểm soát với tối thiểu hai điểm. Đồ họa và hoạt ảnh liên quan đến web thường sử dụng đường cong Bézier bậc ba (cubic Bézier), là đường cong với bốn điểm kiểm soát P<sub>0</sub>, P<sub>1</sub>, P<sub>2</sub> và P<sub>3</sub>.

Để vẽ một đường cong Bézier bậc hai, hai đường tưởng tượng được vẽ, một từ P<sub>0</sub> đến P<sub>1</sub> và đường kia từ P<sub>1</sub> đến P<sub>2</sub>. Một đường tưởng tượng thứ ba được vẽ với điểm bắt đầu di chuyển đều trên đường trợ giúp đầu tiên và điểm kết thúc trên đường trợ giúp thứ hai. Trên đường tưởng tượng này, một điểm được vẽ từ điểm bắt đầu di chuyển đều đến điểm kết thúc. Đường cong mà điểm này mô tả là đường cong Bézier. Đây là minh họa động về việc tạo ra đường cong:

![Vẽ đường cong Bézier](bezier_2_big.gif)

## Xem thêm

- [Bézier curve](https://en.wikipedia.org/wiki/B%C3%A9zier_curve) trên Wikipedia
- [Hàm easing Bézier bậc ba trong CSS](/en-US/docs/Web/CSS/Reference/Values/easing-function/cubic-bezier)
- Thuộc tính SVG {{SVGAttr("keySplines")}}
