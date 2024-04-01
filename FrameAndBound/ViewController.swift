import UIKit

class ViewController: UIViewController {
    @IBOutlet private weak var boundsLabel: UILabel!
    @IBOutlet private weak var frameLabel: UILabel!
    @IBOutlet private weak var rotateButton: UIButton!
    @IBOutlet private weak var chidView: UIView!
    
    var rotationDegrees: CGFloat = 0
    
    var blueView: UIView!
    var yellowView: UIView!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
         setupFrameView()
         setupDemoView()
        view.layoutIfNeeded()
         updateLabels()
    }
    
    private func setupDemoView() {
        blueView  = UIView(frame: .zero)
        blueView.backgroundColor = UIColor.blue
        view.addSubview(blueView)

        blueView.translatesAutoresizingMaskIntoConstraints = false
        blueView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        blueView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        blueView.widthAnchor.constraint(equalToConstant: 300).isActive = true
        blueView.heightAnchor.constraint(equalToConstant: 150).isActive = true
    }
    
    private func setupFrameView() {
        yellowView = UIView(frame: .zero)
        yellowView.backgroundColor = UIColor.yellow
        self.view.addSubview(yellowView)
    }
    
    @IBAction private func rotateButtonTapped(_ sender: UIButton) {
       didRotate()
    }
    
    private func didRotate()  {
        rotationDegrees += 30
        blueView.transform = CGAffineTransform(rotationAngle: rotationDegrees * .pi / 180)
        
        yellowView.frame = blueView.frame
        updateLabels()
    }
    
    // When you modify the frame of a view, you are also changing its position and size in the superview,
    // When you modify the bounds of a view, you are only changing its internal size, keeping the position of the view in the superview.
    func updateLabels() {
        // Frame represents the position(x,y) and size(width,height) of the view relative to its superview (parent view) in the screen coordinate system
        frameLabel.text = """
                    ➡️FRAME (Yellow)
                    X: \(blueView.frame.origin.x.rounded())
                    Y: \(blueView.frame.origin.y.rounded())
                    Width: \(blueView.frame.size.width.rounded())
                    Height: \(blueView.frame.size.height.rounded())
        """
        // Bounds represents the internal bounding rectangle of the view in its own local coordinate system.
        // Origin is always (0,0)
        boundsLabel.text = """
                    ➡️ BOUNDS (Blue)
                    X: \(blueView.bounds.origin.x)
                    Y: \(blueView.bounds.origin.y)
                    Width: \(blueView.bounds.size.width)
                    Height: \(blueView.bounds.size.height)
        """
    }
}

