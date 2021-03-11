# ZQPopupController

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

4. 自定义动画遵循 PopupAnimatorProtocal代理

```
class Animation: PopupAnimatorProtocal  {
    
    var showAnimation: UIViewControllerAnimatedTransitioning? { 
        retrun xxx
        }
    
    var dismissAnimation: UIViewControllerAnimatedTransitioning? { 
        return xxx
        }
}

let animation = Animation()
PopupController.show(testVC, animation:animation)

```

4. 其他参数配置见Demo


### 其他

支持 Swift Package Manager 导入


### TODO

- [] 添加cocoapods支持
- [x] 默认动画中添加fade支持
- [x] 在当前目录中添加Demo 
