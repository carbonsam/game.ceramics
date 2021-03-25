using UnityEngine;

public class TapToThrow : MonoBehaviour
{
    private Rigidbody rigidbody;
    
    public float YForce = 100f;
    public float ZForce = 100f;

    // Start is called before the first frame update
    void Start()
    {
        rigidbody = GetComponent<Rigidbody>();
        rigidbody.AddForce(new Vector3(0, YForce, ZForce));
    }

    // Update is called once per frame
    void Update()
    {
        if (!Input.GetMouseButtonDown(0)) return;
        
        var ray = Camera.main.ScreenPointToRay(Input.mousePosition);
        if (!Physics.Raycast(ray, out var hit)) return;
        if (hit.collider.tag == "snowball")
        {
            OnMouseDrag();
        }
    }

    void OnMouseDrag()
    {
        var point = Camera.main.ScreenToWorldPoint(Input.mousePosition);
        gameObject.transform.position = new Vector3(point.x, point.y, gameObject.transform.position.z);
        rigidbody.velocity = new Vector3(0,0,0);
    }
}
