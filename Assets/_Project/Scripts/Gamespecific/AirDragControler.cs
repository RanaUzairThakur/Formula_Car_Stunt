using UnityEngine;

public class AirDragControler : MonoBehaviour
{
    public float Value =0.7f;
    // Start is called before the first frame update
    void Start()
    {

    }

    void OnTriggerEnter(Collider col)
    {
        if (col.gameObject.CompareTag("Player"))
        {
            col.gameObject.GetComponentInParent<Rigidbody>().drag = Value;
            col.gameObject.GetComponentInParent<Rigidbody>().angularVelocity = Vector3.zero;
        }
    }
    private void OnTriggerExit(Collider col)
    {
        if (col.gameObject.CompareTag("Player"))
        {
            col.gameObject.GetComponentInParent<Rigidbody>().drag = 0.01f;
        }
    }

}
