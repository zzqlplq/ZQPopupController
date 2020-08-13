# ZZQCustomAlertView

view或者viewcontroller，只要遵循PopupProtocol代理，调用指定方法便可被弹出。弹出动画支持自定义


### 使用方法

1. 被弹出的ViewController需要遵循 PopupProtocol 代理

```
class TestViewController: UIViewController, PopupProtocol 
```

2. 在需要弹出的地方调用show方法

```
let testVC = TestViewController()
PopupController.show(testVC)
```

3. 需要移除的时候调用dismiss方法

```
PopupController.dismiss(self)
```

4. 更多使用方法见demo